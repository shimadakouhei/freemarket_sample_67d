require 'test_helper'

class CardsControllerTest < ActionDispatch::IntegrationTest
  test "should get buy" do
    get cards_buy_url
    assert_response :success
  end

end
