class AddIsAuthorToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :is_author, :boolean, null: false, default: false
  end
end
