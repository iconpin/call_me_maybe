class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets do |t|
      t.references :user, null: false
      t.string :type, null: false

      t.timestamps
    end
  end
end
