class Notification < ApplicationRecord
  belongs_to :user

  belongs_to :loan, optional: true
  belongs_to :wallet_transaction, optional: true

  def self.send_notification(...)
    create(...)
  end

  def self.send_notification!(...)
    create!(...)
  end
end
