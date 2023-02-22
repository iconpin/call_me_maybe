class LoanSubscriber
  def wallet_transaction_updated(wallet_transaction:)
    wallet_transaction.loan.refresh_state
  end
end

