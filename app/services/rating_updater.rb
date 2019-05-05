class RatingUpdater
  def initialize(user)
    @user = user
  end

  def call
    user.update(reputation: reputation)
  end

  private

  attr_reader :user

  def reputation
    user.answers.where("votes_count > 0").where(is_author: false).count +
      user.answers.where(is_author: true).count * 2
  end
end
