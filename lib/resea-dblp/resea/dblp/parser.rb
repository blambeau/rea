module Resea
  module DBLP
    class Parser

      def self.parse(*args, &bl)
        new.parse(*args, &bl)
      end

      def parse(path)
        if path.respond_to?(:to_path)
          parse_text(Path(path).read, path)
        else
          parse_text(path, nil)
        end
      end

      private

      def parse_xml(xml, source)
        parsed = Nokogiri::XML(xml.to_s, source.to_s, nil, 
                                Nokogiri::XML::ParseOptions::STRICT)
        block_given? ? yield(parsed) : parsed
      rescue NoMethodError, Nokogiri::XML::SyntaxError
        unrecognized!(source)
      end

      def unrecognized!(source)
        msg = "Error while parsing #{source.basename}"
        msg << ", #{$!.message}" if $!
        raise Resea::UnrecognizedError, msg
      end

    end # class Parser
  end # module DBLP
end # module Resea
