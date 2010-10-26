require 'test_helper'

class BlogTest < ActionDispatch::IntegrationTest
  test "See the index" do
    visit root_path
    assert_see "Blog Posts"
  end
end
