require "test_helper"

class FraudSubscriberTest < ActiveSupport::TestCase
  test 'wallet_transaction_updated - starts a fraud check' do
    wallet_transaction =
      WalletTransaction.create!(
        wallet: wallets(:clara_tabapay),
        loan: loans(:clara_100),
        amount: 100,
        status: "success"
      )

    assert_changes -> { FraudCheck.count }, from: FraudCheck.count, to: FraudCheck.count + 1 do
      FraudSubscriber.new.wallet_transaction_updated(wallet_transaction)
    end

    fraud_check = FraudCheck.last

    assert_equal wallet_transaction, fraud_check.wallet_transaction
    assert_equal "pending", fraud_check.state
    assert_nil fraud_check.resolution
  end
end

