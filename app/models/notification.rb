class Notification < ApplicationRecord
  belongs_to :user, required: true

  belongs_to :loan, required: false
  belongs_to :wallet_transaction, required: false
end
