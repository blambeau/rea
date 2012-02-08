require 'spec_helper'
module Resea
  describe WorkKey, "to_ruby_literal" do

    let(:wk){ Resea::WorkKey("dblp://conf/icse/DamasLRL09") }

    it 'returns an evaluable expression' do
      eval(wk.to_ruby_literal).should be_a(WorkKey)
    end

    it 'should be equal to the original' do
      eval(wk.to_ruby_literal).should eq(wk)
    end

    it 'should be understood by Alf' do
      Alf::Tools.to_ruby_literal(wk).should eq(wk.to_ruby_literal)
    end

  end
end # module Resea
