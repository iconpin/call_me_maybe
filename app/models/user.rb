class User < ApplicationRecord
  has_many :wallets
  has_many :wallet_transactions, through: :wallets
  has_many :loans
end
