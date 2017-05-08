class AddChargeIdToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :charge_id, :integer
  end
end
