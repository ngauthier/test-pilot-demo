require 'test_helper'

class BlogTest < ActionDispatch::IntegrationTest
  test "See the index" do
    visit root_path
    assert_see "Blog Posts"
  end

  test "Create a new post" do
    BlogPilot do
      assert_difference("Blog.count") do
        create(
          Blog.new(
            :title => 'a blog title',
            :body => 'a blog body'
          )
        )
      end
    end
  end

  test "See some blog posts - Pilot" do
    b1 = Blog.create!(:title => "My post", :body => "This is my new blog post")
    b2 = Blog.create!(:title => "My second post", :body => "This is my second blog post")

    BlogPilot do
      assert_exists(b1)
      assert_exists(b2)
    end
  end

  test "Delete a blog post" do
    b = Blog.create!(:title => "delete me", :body => "x")
    BlogPilot do
      assert_exists(b)
      assert_difference("Blog.count", -1) do
        delete(b)
      end
    end
  end
end
