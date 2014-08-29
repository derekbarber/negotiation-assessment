class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.text :title
      t.integer :display_order

      t.belongs_to :assessment

      t.timestamps
    end
    add_index :sections, :assessment_id
  end
end
