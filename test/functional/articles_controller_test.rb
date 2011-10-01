require 'test_helper'

class ArticlesControllerTest < ActionController::TestCase
  test "should be able to get a single article" do
    get :show, :id => Article.order("id").first.id

    assert_response :success
    assert_select "h2", "MyString Two"
  end
end
