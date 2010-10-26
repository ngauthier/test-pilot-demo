ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara'
require 'capybara/dsl'
Capybara.app = TestPilotDemo::Application

class ActiveSupport::TestCase
  include Capybara

  def assert_see(content)
    assert(page.has_content?(content), "Expected page to contain \"#{content}\", but it didn't")
  end
end
