class Wallet < ApplicationRecord
  self._inheritance_column = :_type_disabled

  belongs_to :user

  has_many :wallet_transactions
end
