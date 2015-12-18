# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  list_id    :integer
#  name       :string
#  completed  :boolean
#  created_at :datetime
#  updated_at :datetime
#

class ItemSerializer < ActiveModel::Serializer
  attributes :id
end
