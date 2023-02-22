class FraudSubscriber
  def wallet_transaction_updated(wallet_transaction:)
    FraudCheck.start(
      wallet_transaction: wallet_transaction,
      state: 'pending',
      resolution: nil,
    )
  end
end
