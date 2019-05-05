# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  remember_created_at    :datetime
#  reputation             :integer          default(0), not null
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  username               :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#

class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true

  validate :validate_username

  def validate_username
    errors.add(:username, :invalid) if User.where(email: username).exists?
  end

  after_create :assign_default_role

  def assign_default_role
    add_role(:member) if roles.blank?
  end

  def role_name
    return if roles.first.blank?

    I18n.t("roles.#{roles.first.name}")
  end
end
