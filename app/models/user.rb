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

class User < ActiveRecord::Base

  has_many :lists, dependent: :destroy
  
end
