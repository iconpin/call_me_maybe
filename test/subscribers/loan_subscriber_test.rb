require "test_helper"

class LoanSubscriberTest < ActiveSupport::TestCase
  test 'wallet_transaction_updated - full repayment' do
    wallet_transaction =
      WalletTransaction.create!(
        wallet: wallets(:clara_tabapay),
        loan: loans(:clara_100),
        amount: 100,
        status: "success"
      )

    assert_changes -> { loans(:clara_100).reload.state }, from: 'unpaid', to: 'repaid' do
      LoanSubscriber.new.wallet_transaction_updated(wallet_transaction:)
    end
  end

  test "wallet_transaction_updated - partial repayment" do
    wallet_transaction =
      WalletTransaction.create!(
        wallet: wallets(:clara_tabapay),
        loan: loans(:clara_100),
        amount: 50,
        status: "success"
      )

    assert_no_changes -> { loans(:clara_100).reload.state }, from: 'unpaid' do
      LoanSubscriber.new.wallet_transaction_updated(wallet_transaction:)
    end
  end

  test "wallet_transaction_updated - failed repayment" do
    wallet_transaction =
      WalletTransaction.create!(
        wallet: wallets(:clara_tabapay),
        loan: loans(:clara_100),
        amount: 100,
        status: "failure"
      )

    assert_no_changes -> { loans(:clara_100).reload.state }, from: 'unpaid' do
      LoanSubscriber.new.wallet_transaction_updated(wallet_transaction:)
    end
  end
end
