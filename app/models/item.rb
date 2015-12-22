# == Schema Information
#
# Table name: items
#
#  id          :integer          not null, primary key
#  list_id     :integer
#  description :string
#  name        :string
#  completed   :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

class Item < ActiveRecord::Base
  validates :description, length: { minimum: 5 }, presence: true
  belongs_to :list

end
