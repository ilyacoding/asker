# == Schema Information
#
# Table name: roles
#
#  id            :bigint(8)        not null, primary key
#  name          :string(255)
#  resource_type :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  resource_id   :bigint(8)
#
# Indexes
#
#  index_roles_on_name                                    (name)
#  index_roles_on_name_and_resource_type_and_resource_id  (name,resource_type,resource_id)
#  index_roles_on_resource_type_and_resource_id           (resource_type,resource_id)
#

class Role < ApplicationRecord
  has_and_belongs_to_many :users, join_table: :users_roles

  belongs_to :resource,
             polymorphic: true,
             optional: true

  validates :resource_type,
            inclusion: { in: Rolify.resource_types },
            allow_nil: true

  scopify
end
