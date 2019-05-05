class VoteManager
  class << self
    def voted_for?(user, answer)
      Vote.where(user: user, answer: answer).any?
    end

    def vote(user, answer)
      Vote.create(user: user, answer: answer).tap do
        answer.update(is_author: true) if answer.question.user.id == user.id
        RatingUpdater.new(answer.user).call
      end
    end
  end
end
