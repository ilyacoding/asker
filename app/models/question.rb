# == Schema Information
#
# Table name: questions
#
#  id          :bigint(8)        not null, primary key
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :bigint(8)
#  user_id     :bigint(8)
#
# Indexes
#
#  index_questions_on_category_id  (category_id)
#  index_questions_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (user_id => users.id)
#

class Question < ApplicationRecord
  validates_presence_of :description, :category_id, :user_id

  belongs_to :user, counter_cache: true
  belongs_to :category
  has_many :answers, dependent: :destroy

  after_create :save_to_marlin
  before_destroy :delete_from_marlin

  private

  def save_to_marlin
    QuestionSaver.new(id, description).call
  end

  def delete_from_marlin
    QuestionDeleter.new(id, description).call
  end
end
