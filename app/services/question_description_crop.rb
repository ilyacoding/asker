class QuestionDescriptionCrop
  def self.call(description)
    description.downcase.gsub(/[^a-zа-яА-Я0-9\s]/i, "").split
  end
end
