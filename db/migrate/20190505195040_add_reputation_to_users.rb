class AddReputationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :reputation, :integer, null: false, default: 0
  end
end
