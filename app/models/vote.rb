# == Schema Information
#
# Table name: votes
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  answer_id  :bigint(8)
#  user_id    :bigint(8)
#
# Indexes
#
#  index_votes_on_answer_id  (answer_id)
#  index_votes_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (answer_id => answers.id)
#  fk_rails_...  (user_id => users.id)
#

class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :answer, counter_cache: true

  validates :user_id, uniqueness: { scope: :answer_id }
end
