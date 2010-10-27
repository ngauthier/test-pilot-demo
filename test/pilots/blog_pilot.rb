class BlogPilot < TestPilot::Core
  def assert_exists(blog)
    visit(root_path)
    assert_see "Blog Posts"
    within("#blogs") { assert_see(blog.title) }
    within("#blogs") { assert_see(blog.body) }
  end

  def create(blog)
    visit root_path
    fill_in "Title", :with => blog.title
    fill_in "Body", :with => blog.body
    click_button 'Create Post'
    assert_on root_path
    assert_see blog.title
    assert_see blog.body
  end

  def delete(blog)
    extend ActionController::RecordIdentifier
    visit root_path
    within("##{dom_id(blog)}") { click_button 'Delete' }
    assert_on root_path
    refute_see blog.title
    refute_see blog.body
  end
end

