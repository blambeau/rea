require 'spec_helper'
module Resea
  describe WorkKey, ".parse" do

    it 'works on a typical dblp key' do
      wk = WorkKey.parse("dblp://conf/icse/DamasLRL09")
      wk.should be_a(WorkKey)
      wk.provider.should eq("dblp")
      wk.identifier.should eq("conf/icse/DamasLRL09")
    end

    it 'is aliased as Resea::WorkKey()' do
      Resea::WorkKey("dblp://conf/icse/DamasLRL09").should be_a(WorkKey)
    end

    it 'is idempotent' do
      wk = Resea::WorkKey("dblp://conf/icse/DamasLRL09")
      Resea::WorkKey(wk).should eq(wk)
    end

    it 'raises an ArgumentError on an invalid key' do
      proc{ 
        WorkKey.parse("invalidkey") 
      }.should raise_error(ArgumentError, "Invalid work key invalidkey")
    end

  end
end # module Resea
