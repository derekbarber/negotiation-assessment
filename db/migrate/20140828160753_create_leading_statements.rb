class CreateLeadingStatements < ActiveRecord::Migration
  def change
    create_table :leading_statements do |t|
      t.text :text
      t.string :context_message

      t.belongs_to :assessment

      t.timestamps
    end
    add_index :leading_statements, :assessment_id
  end
end
