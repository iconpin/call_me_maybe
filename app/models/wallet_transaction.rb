class WalletTransaction < ApplicationRecord
  belongs_to :wallet
  belongs_to :loan

  validates :status, inclusion: { in: %w[pending success failure] }
end
