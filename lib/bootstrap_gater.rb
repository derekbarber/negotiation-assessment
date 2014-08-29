class ActiveRecord::Migration
  def inherited(cl) cl.const_set("FILE", caller[-1].freeze) end
  def migrate_with_sha_writer(direction)
    migrate_without_sha_writer(direction)

    file_path = if name.constantize.instance_methods.include?(:change)
                  name.constantize.instance_method(:change).source_location.first.split("/").last
                elsif name.constantize.instance_methods.include?(:up)
                  name.constantize.instance_method(:up).source_location.first.split("/").last
                elsif name.constantize.instance_methods.include?(:down)
                  name.constantize.instance_method(:down).source_location.first.split("/").last
                end
    file_path = "db/migrate/" + file_path

    BootstrapGater.update_file(file_path, direction)
  end
  alias_method_chain :migrate, :sha_writer
end

class BootstrapGater
  GATE_FILE = ".bootstrap_gater"

  def self.update_file(file_path, direction)
    hash = begin
             YAML.load(File.read(GATE_FILE))
           rescue
             {}
           end
    if direction == :up
      hash[file_path] = Digest::SHA2.hexdigest(File.read(file_path))
    elsif direction == :down
      hash.delete(file_path)
    end
    File.open(GATE_FILE, 'w') do |f|
      f.puts hash.to_yaml
    end
  end

  def self.clear
    if File.exists? GATE_FILE
      File.delete GATE_FILE
    end
  end

  def self.check
    if File.exists? GATE_FILE
      hash = YAML.load(File.read(GATE_FILE))

      Dir["db/migrate/*"].each do |file_path|
        if hash[file_path].blank?
          puts "Migration #{file_path} has been added. Please run `bundle exec rake db:migrate`.".red
        elsif hash[file_path] != Digest::SHA2.hexdigest(File.read(file_path))
          puts "Migration #{file_path} has changed. Please run `bundle exec rake db:bootstrap`.".red
        end
      end
    else
      puts "WARNING: Bootstrap Gater unable to check database status. Run `rake db:bootstrap` to setup Bootstrap Gater.".yellow
    end

    true
  end
end
