class WalletTransaction < ApplicationRecord
  belongs_to :wallet
  belongs_to :loan

  validates :status, inclusion: { in: %w[pending success failure] }

  after_save :send_notification

  private

  def send_notification
    Notification.send_notification(
      user: loan.user,
      loan: loan,
      wallet_transaction: self,
      text: "Thank you #{loan.user.name} for your $#{self.amount.to_i} loan repayment!",
    )
  end
end
