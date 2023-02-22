class AddStatusToWalletTransactions < ActiveRecord::Migration[7.0]
  def change
    add_column :wallet_transactions, :status, :string, null: false
  end
end
