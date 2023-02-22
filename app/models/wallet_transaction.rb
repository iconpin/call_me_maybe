class WalletTransaction < ApplicationRecord
  belongs_to :wallet
  belongs_to :loan

  validates :status, inclusion: { in: %w[pending success failure] }

  after_save :send_notification
  after_save :refresh_loan_state

  private

  def send_notification
    Notification.send_notification(
      user: loan.user,
      loan: loan,
      wallet_transaction: self,
      text: "Thank you #{loan.user.name} for your $#{self.amount.to_i} loan repayment!",
    )
  end

  def refresh_loan_state
    loan.refresh_state
  end
end
