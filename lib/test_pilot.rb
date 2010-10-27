module TestPilot
  class Core < ActionDispatch::IntegrationTest
    def initialize ; end # override new from inherited class
    def self.inherited(subclass)
      TestPilot::Dsl.send(:define_method, subclass.to_s) do |&block|
        subclass.new.instance_eval(&block)
      end
    end
  end
  module Dsl ; end
end


