require "test_helper"

class NotificationSubscriberTest < ActiveSupport::TestCase
  test "wallet_transaction_updated - sends a notification" do
    wallet_transaction =
      WalletTransaction.create!(
        wallet: wallets(:alice_tabapay),
        loan: loans(:alice_100),
        amount: 25,
        status: "success"
      )

    assert_changes -> { Notification.count }, from: Notification.count, to: Notification.count + 1 do
      NotificationSubscriber.new.wallet_transaction_updated(wallet_transaction)
    end

    notification = Notification.last

    assert_equal users(:alice), notification.user
    assert_equal wallet_transaction, notification.wallet_transaction
    assert_equal 'Thank you Alice for your $25 loan repayment!', notification.text
  end
end
