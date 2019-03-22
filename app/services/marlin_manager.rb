class MarlinManager
  attr_reader :key

  def initialize(key)
    @key = key
  end

  def read_key
    MarlinActions::Get.new(key).perform
  end

  def put_key(value)
    MarlinActions::Put.new(key).perform(value)
  end

  def delete_key
    MarlinActions::Delete.new(key).perform
  end
end
