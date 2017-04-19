class AddProductIdToCharges < ActiveRecord::Migration[5.0]
  def change
    add_column :charges, :product_id, :integer
  end
end
