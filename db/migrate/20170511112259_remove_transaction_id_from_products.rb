class RemoveTransactionIdFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :transaction_id, :integer
  end
end
