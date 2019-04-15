class QuestionDeleter
  attr_accessor :question_id, :description

  def initialize(question_id, description)
    @question_id = question_id
    @description = description
  end

  def call
    words.each { |word| delete_word(word) }
  end

  private

  def delete_word(word)
    WordProcessor.new(word).delete(question_id)
  end

  def words
    @words ||= QuestionDescriptionCrop.call(description)
  end
end
