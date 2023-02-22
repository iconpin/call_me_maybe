class CreateWalletTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :wallet_transactions do |t|
      t.references :wallet, null: false
      t.references :loan, null: false

      t.decimal :amount, null: false

      t.timestamps
    end
  end
end
