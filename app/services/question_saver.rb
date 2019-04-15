class QuestionSaver
  attr_accessor :question_id, :description

  def initialize(question_id, description)
    @question_id = question_id
    @description = description
  end

  def call
    words.each { |word| process_word(word) }
  end

  private

  def process_word(word)
    WordProcessor.new(word).save(question_id)
  end

  def words
    @words ||= QuestionDescriptionCrop.call(description)
  end
end
