require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  def setup
    ActionMailer::Base.deliveries.clear
  end

  test "send welcome email" do
    get root_path
    assert_equal 1, ActionMailer::Base.deliveries.size
  end
end
