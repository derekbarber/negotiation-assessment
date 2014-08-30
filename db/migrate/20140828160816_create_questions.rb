class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question_text
      t.string :question_type
      t.string :assessment_style
      t.integer :display_order

      t.belongs_to :section

      t.timestamps
    end
    add_index :questions, :section_id
  end
end
