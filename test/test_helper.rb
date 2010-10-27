ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara'
require 'capybara/dsl'
require 'test_pilot'
Capybara.app = TestPilotDemo::Application

Dir.glob(File.join(Rails.root, 'test', 'pilots', '**', '*.rb')).each{|f| require f}

class ActiveSupport::TestCase
  include Capybara
  include TestPilot::Dsl

  def assert_see(content)
    assert(page.has_content?(content), "Expected page to contain \"#{content}\", but it didn't")
  end
  def refute_see(content)
    assert(!page.has_content?(content), "Expected page to not contain \"#{content}\", but it did")
  end


  def assert_on(path)
    assert_equal(path, current_path)
  end

end

