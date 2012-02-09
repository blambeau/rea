$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rea'

module Helpers
  def WorkKey(str)
    Resea::WorkKey(str)
  end
end

RSpec.configure do |c|
  c.include Helpers
end
