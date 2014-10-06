class CreateRespondents < ActiveRecord::Migration
  def change
    create_table :respondents do |t|
      t.string :email,              null: false, default: ""
      t.string :first_name
      t.string :last_name
      t.string :access_code

      t.hstore :responses

      t.belongs_to :organization, index: true
      t.belongs_to :user, index: true
      t.belongs_to :assessment, index: true

      t.timestamps
    end
  end
end
