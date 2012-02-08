require 'spec_helper'
module Resea
  describe WorkKey, "to_s" do

    let(:wk){ Resea::WorkKey("dblp://conf/icse/DamasLRL09") }

    it 'works on a typical dblp key' do
      wk.to_s.should eq("dblp://conf/icse/DamasLRL09")
    end

  end
end # module Resea
