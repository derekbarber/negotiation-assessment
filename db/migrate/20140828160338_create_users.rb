class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :access_code

      t.belongs_to :organization, index: true

      t.timestamps
    end
  end
end
