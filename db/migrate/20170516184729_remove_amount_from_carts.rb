class RemoveAmountFromCarts < ActiveRecord::Migration[5.0]
  def change
    remove_column :carts, :amount, :integer
  end
end