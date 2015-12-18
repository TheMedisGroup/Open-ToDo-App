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

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
