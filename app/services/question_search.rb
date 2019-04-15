class QuestionSearch
  attr_reader :description

  def initialize(description)
    @description = description
  end

  def search_question
    return if similar_question_id.blank?

    Question.where(id: similar_question_id).first
  end

  def similar_question_id
    @similar_question_id ||= marlin_question_ids.max_by { |_key, value| value }[0]
  end

  def marlin_question_ids
    words.map { |word| get_ids(word) }.flatten.inject(Hash.new(0)) do |hash, element|
      hash[element] += 1
      hash
    end
  end

  private

  def get_ids(word)
    WordProcessor.new(word).get_ids
  end

  def words
    QuestionDescriptionCrop.call(description)
  end
end
