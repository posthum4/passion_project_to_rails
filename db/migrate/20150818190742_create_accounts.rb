class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.integer :user_id
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.string :catch_phrase
      t.string :logo

      t.timestamps
    end
  end
end
