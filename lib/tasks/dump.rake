namespace :db do
  desc 'Dump the database to db/dumps/development.dump'
  task :dump => :environment do 
    puts "Dumping the development database to db/dumps/development.dump"
    config = ActiveRecord::Base.configurations[Rails.env]
    ENV['PGPASSWORD'] = config["password"]
    `pg_dump -Fc --no-acl --no-owner -h localhost -U #{config["username"]} -d smartsettle_development > db/dumps/development.dump`
  end
end
