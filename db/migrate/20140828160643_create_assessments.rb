class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.string :name, :default => ''
      t.text :overview, :default => ''
      t.text :instructions, :default => ''
      t.string :access_code
      t.string :status

      t.belongs_to :organization, index: true
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
