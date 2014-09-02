class CreateRespondents < ActiveRecord::Migration
  def change
    create_table :respondents do |t|
      t.string :email
      t.integer :assessment_id
      t.hstore :responses

      t.timestamps
    end
  end
end
