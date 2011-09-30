require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns[:articles]
  end

  test "should see the first blog post on the index" do
    get :index
    assert_response :success

    assert_select "h2", "MyString One"
  end
end
