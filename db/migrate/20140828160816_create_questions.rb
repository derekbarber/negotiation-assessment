class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question_text
      t.string :question_type
      t.string :assessment_style
      t.integer :leading_statement_id
      t.integer :display_order

      t.belongs_to :assessment, index: true

      t.timestamps
    end
  end
end
