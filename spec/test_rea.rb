require File.expand_path('../spec_helper', __FILE__)
describe Rea do

  it "should have a version number" do
    Rea.const_defined?(:VERSION).should be_true
  end

  it 'should have providers' do
    Rea::providers.should eq([Rea::DBLP])
  end

end
