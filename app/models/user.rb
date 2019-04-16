# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  rolify
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  after_create :assign_default_role

  def assign_default_role
    add_role(:member) if roles.blank?
  end

  def role_name
    return if roles.first.blank?

    I18n.t("roles.#{roles.first.name}")
  end
end
