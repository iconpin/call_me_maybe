class FraudCheck < ApplicationRecord
  belongs_to :wallet_transaction

  validates :state, inclusion: { in: %w[pending finished] }
  validates :resolution, inclusion: { in: %w[all_good its_fraud] }, allow_nil: true

  def self.start(...)
    create(...)
  end

  def self.start!(...)
    create!(...)
  end
end
