class CreateCharges < ActiveRecord::Migration[5.0]
  def change
    create_table :charges do |t|
      t.string :stripeEmail
      t.string :stripeToken
      t.integer :transaction_id

      t.timestamps
    end
  end
end
