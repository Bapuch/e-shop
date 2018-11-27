require 'test_helper'

class ShopControllerTest < ActionDispatch::IntegrationTest
  test "should get cart" do
    get shop_cart_url
    assert_response :success
  end

  test "should get order" do
    get shop_order_url
    assert_response :success
  end

end
