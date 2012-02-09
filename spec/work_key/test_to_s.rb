require 'spec_helper'
module Rea
  describe WorkKey, "to_s" do

    let(:wk){ Rea::WorkKey("dblp://conf/icse/DamasLRL09") }

    it 'works on a typical dblp key' do
      wk.to_s.should eq("dblp://conf/icse/DamasLRL09")
    end

  end
end # module Rea
