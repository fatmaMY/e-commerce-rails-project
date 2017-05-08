class RemoveStripeTokenFromTransactions < ActiveRecord::Migration[5.0]
  def change
    remove_column :transactions, :stripe_token, :string
  end
end
