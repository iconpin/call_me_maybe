class CreateFraudChecks < ActiveRecord::Migration[7.0]
  def change
    create_table :fraud_checks do |t|
      t.references :wallet_transaction, null: false
      t.string :state, null: false
      t.string :resolution, null: true

      t.timestamps
    end
  end
end
