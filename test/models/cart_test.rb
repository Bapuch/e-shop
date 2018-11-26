require 'test_helper'

class CartTest < ActiveSupport::TestCase

   test "associations" do
    should belong_to :user
  end
  
end
