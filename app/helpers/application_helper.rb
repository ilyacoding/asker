module ApplicationHelper
  def gravatar_url(email, size = 64)
    gravatar = Digest::MD5::hexdigest(email).downcase
    "http://gravatar.com/avatar/#{gravatar}.png?s=#{size}"
  end
end
