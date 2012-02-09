require 'spec_helper'
module Resea
  describe DBLP, "search" do

    def search(x)
      DBLP.search(x)
    end

    it 'works with a title' do
      search(:title => "Generating Annotated Behavior Models").should be_a(Alf::Relation)
    end

    it 'raises an NotImplementedError if no title' do
      lambda{ search(:author => "Lambeau") }.should raise_error(NotImplementedError, /Lambeau/)
    end

  end # describe DBLP#grab
end # module Resea
