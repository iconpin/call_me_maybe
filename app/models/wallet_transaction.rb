class WalletTransaction < ApplicationRecord
  include Wisper::Publisher

  belongs_to :wallet
  belongs_to :loan

  validates :status, inclusion: { in: %w[pending success failure] }

  after_save :broadcast_updated_event

  private

  def broadcast_updated_event
    broadcast(:wallet_transaction_updated, wallet_transaction: self)
  end
end
