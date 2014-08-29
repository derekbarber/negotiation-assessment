class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.string :style
      t.string :type
      t.integer :display_order

      t.belongs_to :section

      t.timestamps
    end
    add_index :questions, :section_id
  end
end
