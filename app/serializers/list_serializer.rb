# == Schema Information
#
# Table name: lists
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string
#  desription  :string
#  created_at  :datetime
#  updated_at  :datetime
#  permissions :string           default("private")
#

class ListSerializer < ActiveModel::Serializer
  attributes :id
end
