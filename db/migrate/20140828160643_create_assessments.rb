class CreateAssessments < ActiveRecord::Migration
  def change
    create_table :assessments do |t|
      t.string :name, :default => ''
      t.text :overview, :default => ''
      t.text :instructions, :default => ''
      t.string :status

      t.belongs_to :organization

      t.timestamps
    end
    add_index :assessments, :organization_id
  end
end
