require 'test_helper'

class BlogTest < ActionDispatch::IntegrationTest
  test "See the index" do
    visit root_path
    assert_see "Blog Posts"
  end

  test "Create a new post" do
    visit root_path
    fill_in "Title", :with => "a blog title"
    fill_in "Body", :with => "a blog body"
    click_button 'Create Post'
    assert_on root_path
    assert_see 'a blog title'
    assert_see 'a blog body'
  end

  test "See some blog posts - Pilot" do
    b1 = Blog.create!(:title => "My post", :body => "This is my new blog post")
    b2 = Blog.create!(:title => "My second post", :body => "This is my second blog post")

    BlogPilot do
      assert_see_blog(b1)
      assert_see_blog(b2)
    end

  end
end
