# == Schema Information
#
# Table name: lists
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string
#  created_at  :datetime
#  updated_at  :datetime
#  permissions :integer
#

require 'test_helper'

class ListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
