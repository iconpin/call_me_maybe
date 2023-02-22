class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.references :user, null: false
      t.references :loan, null: true
      t.references :wallet_transaction, null: true

      t.string :text, null: false

      t.timestamps
    end
  end
end
