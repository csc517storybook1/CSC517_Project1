require 'test_helper'

class DeveloperSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid signup information" do
    get signup_path
    assert_no_difference 'Developer.count' do
      post_via_redirect developers_path, developer: { name:  "Example Developer",
          email: "developer@example.com",
          password:              "password",
          password_confirmation: "password" }
    end
    assert_template 'developers/show'
  end
end
