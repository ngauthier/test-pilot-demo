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


