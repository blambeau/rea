require 'spec_helper'
module Resea
  module DBLP
    describe QueryResultParser do

      def parse(x)
        QueryResultParser.parse(Path.dir/"fixtures/query_results"/x)
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

      it 'parses query results correctly' do
        parse("QueryResult.xml").first.should eq({
          :kind    => "inproceedings",
          :key     => "conf/icse/DamasLRL09",
          :title   => "Analyzing critical process models through behavior model synthesis.",
          :source  => "ICSE",
          :year    => "2009",
          :authors => ["Christophe Damas", 
                       "Bernard Lambeau", 
                       "Francois Roucoux",
                       "Axel van Lamsweerde"]
        })
      end

    end
  end # module DBLP
end # module Resea
