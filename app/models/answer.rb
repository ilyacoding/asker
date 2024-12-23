# == Schema Information
#
# Table name: answers
#
#  id          :bigint(8)        not null, primary key
#  content     :string(255)
#  is_author   :boolean          default(FALSE), not null
#  votes_count :bigint(8)        default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :bigint(8)
#  user_id     :bigint(8)
#
# Indexes
#
#  index_answers_on_question_id  (question_id)
#  index_answers_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#  fk_rails_...  (user_id => users.id)
#

class Answer < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :question

  has_many :votes, dependent: :destroy

  validates_presence_of :content
end
