ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara'
require 'capybara/dsl'
Capybara.app = TestPilotDemo::Application

module TestPilot
  class Core < ActionDispatch::IntegrationTest
    def initialize
    end

    def self.inherited(subclass)
      puts "Inherited by #{subclass}"
      TestPilot::Dsl.send(:define_method, subclass.to_s) do |&block|
        subclass.new.instance_eval(&block)
      end
    end
  end

  module Dsl
  end
end

class BlogPilot < TestPilot::Core
  def assert_see_blog(blog)
    visit(root_path)
    assert_see "Blog Posts"
    within("#blogs") { assert_see(blog.title) }
    within("#blogs") { assert_see(blog.body) }
  end
end

  #def BlogPilot(&block)
  #  BlogPilot.new(block.binding).instance_eval{block.call}
  #end

class ActiveSupport::TestCase
  include Capybara
  include TestPilot::Dsl

  def assert_see(content)
    assert(page.has_content?(content), "Expected page to contain \"#{content}\", but it didn't")
  end


  def assert_on(path)
    assert_equal(path, current_path)
  end

end

