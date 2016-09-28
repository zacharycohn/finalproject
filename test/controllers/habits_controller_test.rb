require 'test_helper'

# Shop around for assertions here: http://guides.rubyonrails.org/testing.html#available-assertions

# Controller testing docs: http://guides.rubyonrails.org/testing.html#functional-tests-for-your-controllers


class HabitsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "getting index w/o logging in" do
    get :index
    assert_response :redirect
    assert_response 302
    assert_redirected_to "/users/sign_in"
  end

  test "getting index after logging in" do
    sign_in(users(:ralph))
    get :index
    assert_response :success
    assert_response 200

    assert_match /Monthly Display/, response.body
    assert_match /Weekly Display/, response.body
    assert_match /Daily Display/, response.body
    assert_match /Habit Stats/, response.body
  end

end
