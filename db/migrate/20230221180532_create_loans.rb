class CreateLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :loans do |t|
      t.references :user, null: false
      t.decimal :amount, null: false

      t.timestamps
    end
  end
end
