require "test_helper"

class WalletTransactionTest < ActiveSupport::TestCase
  test "there are fixtures" do
    assert wallet_transactions.count > 0
  end

  test "broadcasts wallet_transaction_updated" do
    wallet_transaction =
      WalletTransaction.new(
        wallet: wallets(:alice_tabapay),
        loan: loans(:alice_100),
        amount: 25,
        status: "success"
      )

    assert_broadcast(:wallet_transaction_updated, wallet_transaction:) do
      wallet_transaction.save!
    end

    assert_broadcast(:wallet_transaction_updated, wallet_transaction:) do
      wallet_transaction.update!(status: 'failure')
    end
  end
end
