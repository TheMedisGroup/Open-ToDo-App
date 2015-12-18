# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string
#  password   :string
#  email      :string
#  created_at :datetime
#  updated_at :datetime
#

class UserSerializer < ActiveModel::Serializer

  attributes :id, :created_at, :username, :email, :password, :updated_at

end
