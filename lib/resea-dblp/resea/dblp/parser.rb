module Resea
  module DBLP
    class Parser

      private

      def parse_xml(xml, source)
        parsed = Nokogiri::XML(xml.to_s, source.to_s, nil, 
                                Nokogiri::XML::ParseOptions::STRICT)
        block_given? ? yield(parsed) : parsed
      rescue NoMethodError, Nokogiri::XML::SyntaxError
        unrecognized!(source)
      end

      def unrecognized!(source)
        raise Resea::UnrecognizedError, "Error while parsing entry (#{source})"
      end

    end # class Parser
  end # module DBLP
end # module Resea
