require 'test_helper'

class CustomerControllerTest < ActionDispatch::IntegrationTest
  test "should get Generate" do
    get customer_Generate_url
    assert_response :success
  end

end
