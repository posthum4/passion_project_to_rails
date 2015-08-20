class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :account, index: true
      t.string :status
      t.date :close_date
      t.string :payment_terms
      t.float :total_amount

      t.timestamps
    end
  end
end
