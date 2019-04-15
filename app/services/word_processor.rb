class WordProcessor
  attr_reader :key

  def initialize(word)
    @key = hash(word)
  end

  def get_ids
    current_state
  end

  def save(question_id)
    save_state(current_state + [question_id])
  end

  def delete(question_id)
    save_state(current_state - [question_id])
  end

  private

  def current_state
    marlin_manager.read_key || []
  end

  def save_state(state)
    marlin_manager.put_key(state)
  end

  def hash(text)
    Digest::MD5.hexdigest(text)
  end

  def marlin_manager
    @marlin_manager ||= MarlinManager.new(key)
  end
end
