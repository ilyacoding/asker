class VoteManager
  class << self
    def voted_for?(user, answer)
      Vote.where(user: user, answer: answer).any?
    end

    def vote(user, answer)
      Vote.create(user: user, answer: answer)
    end
  end
end
