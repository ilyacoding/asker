class QuestionSearch
  attr_reader :exclude_question_id, :description

  def initialize(exclude_question_id, description)
    @exclude_question_id = exclude_question_id
    @description = description
  end

  def similar_answer
    return if (question = search_question).blank?

    answer = question.answers.order("votes_count DESC").where(is_author: true).first
    return answer if answer.present?

    question.answers.order("votes_count DESC").first
  end

  def search_question
    return if similar_question_id.blank?

    Question.where(id: similar_question_id).first
  end

  def similar_question_id
    return if ordered_marlin_questions.blank?

    @similar_question_id ||= ordered_marlin_questions[0]
  end

  def ordered_marlin_questions
    @ordered_marlin_questions ||= marlin_question_ids.max_by { |_key, value| value }
  end

  def marlin_question_ids
    words.map { |word| get_ids(word) }.flatten.each_with_object(Hash.new(0)) do |element, hash|
      next if exclude_question_id.to_i == element.to_i

      hash[element] += 1
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
