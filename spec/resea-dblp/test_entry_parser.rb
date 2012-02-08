require 'spec_helper'
module Resea
  module DBLP
    describe EntryParser do

      def parse(x)
        EntryParser.parse(Path.dir/"fixtures/entries"/x)
      end

      it 'fails gracefully on unrecognized' do
        lambda{ 
          parse("Unrecognized.xml") 
        }.should raise_error(ParseFormatError, /Unrecognized.xml/)
      end

      it 'fails gracefully on erroneous' do
        lambda{ 
          parse("Erroneous.xml") 
        }.should raise_error(ParseError, /Erroneous.xml/)
      end

      it "works on proceedings" do
        got = parse "Damas2009.xml"
        expected = {
          :kind    => "inproceedings",
          :key     => "conf/icse/DamasLRL09",
          :title   => "Analyzing critical process models through behavior model synthesis.",
          :source  => "ICSE",
          :year    => "2009",
          :authors => ["Christophe Damas", 
                       "Bernard Lambeau", 
                       "Francois Roucoux",
                       "Axel van Lamsweerde"]
        }
        got.should eq([expected])
      end

      it "works on queryentry" do
        got = parse "QueryEntry.xml"
        expected = {
          :kind    => "inproceedings",
          :key     => "conf/icse/DamasLRL09",
          :title   => "Analyzing critical process models through behavior model synthesis.",
          :source  => "ICSE 2009:441-451",
          :year    => "2009",
          :authors => ["Christophe Damas", 
                       "Bernard Lambeau", 
                       "Francois Roucoux",
                       "Axel van Lamsweerde"]
        }
        got.should eq([expected])
      end

      it 'works on article' do
        got = parse "Damas2005.xml"
        expected = {
          :kind       => "article",
          :key        => "journals/tse/DamasLDL05",
          :title      => "Generating Annotated Behavior Models from End-User Scenarios.",
          :source     => "IEEE Trans. Software Eng.",
          :year       => "2005",
          :authors    => ["Christophe Damas", 
                          "Bernard Lambeau", 
                          "Pierre Dupont",
                          "Axel van Lamsweerde"]
        }
        got.should eq([expected])
      end

    end
  end # module DBLP
end # module Resea
