class NotificationSubscriber
  def wallet_transaction_updated(wallet_transaction)
    loan = wallet_transaction.loan
    user = wallet_transaction.loan.user

    Notification.send_notification(
      user:,
      loan:,
      wallet_transaction:,
      text: "Thank you #{user.name} for your $#{wallet_transaction.amount.to_i} loan repayment!",
    )
  end
end

