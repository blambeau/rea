require File.expand_path('../spec_helper', __FILE__)
describe Resea do

  it "should have a version number" do
    Resea.const_defined?(:VERSION).should be_true
  end

end
