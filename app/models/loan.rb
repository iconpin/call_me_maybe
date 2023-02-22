class Loan < ApplicationRecord
  belongs_to :user

  has_many :wallet_transactions

  validates :state, inclusion: { in: %w[unpaid repaid] }

  def refresh_state
    state = 
      if wallet_transactions.where(status: 'success').sum(:amount) >= amount
        'repaid'
      else
        'unpaid'
      end

    update(state: state)
  end
end
