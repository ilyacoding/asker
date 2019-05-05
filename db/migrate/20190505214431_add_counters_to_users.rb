class AddCountersToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :questions_count, :bigint, null: false, default: 0
    add_column :users, :answers_count, :bigint, null: false, default: 0
  end
end
