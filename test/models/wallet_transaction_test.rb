require "test_helper"

class WalletTransactionTest < ActiveSupport::TestCase
  test "there are fixtures" do
    assert wallet_transactions.count > 0
  end

  test "sends a notification to the use" do
    wallet_transaction =
      WalletTransaction.create!(
        wallet: wallets(:alice_tabapay),
        loan: loans(:alice_100),
        amount: 25,
        status: "success"
      )

    notification = Notification.last

    assert_equal users(:alice), notification.user
    assert_equal wallet_transaction, notification.wallet_transaction
    assert_equal 'Thank you Alice for your $25 loan repayment!', notification.text
  end
end
