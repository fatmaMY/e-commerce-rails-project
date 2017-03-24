class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.date :date
      t.float :total
      t.integer :user_id
      t.integer :product_id

      t.timestamps
    end
  end
end
