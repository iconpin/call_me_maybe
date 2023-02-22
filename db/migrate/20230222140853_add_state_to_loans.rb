class AddStateToLoans < ActiveRecord::Migration[7.0]
  def change
    add_column :loans, :state, :string, null: false
  end
end
