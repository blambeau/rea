require 'spec_helper'
module Rea
  describe DBLP, "grab" do

    def grab(x)
      DBLP.grab(x)
    end

    it 'works on an existing entry' do
      grab("journals/tse/DamasLDL05").should be_a(Hash)
    end

    it 'raises a NotFoundError on unexisting entry' do
      lambda{ grab("nosuchone") }.should raise_error(NotFoundError, /nosuchone/)
    end

  end # describe DBLP#grab
end # module Rea
