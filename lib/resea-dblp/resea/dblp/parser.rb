module Resea
  module DBLP
    class Parser
      include Resea::ErrorUtils

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
        options = Nokogiri::XML::ParseOptions::STRICT
        parsed  = Nokogiri::XML(xml.to_s, source.to_s, nil, options)
        block_given? ? yield(parsed) : parsed
      rescue NoMethodError
        parse_format_error!(source)
      rescue Nokogiri::XML::SyntaxError
        parse_error!(source)
      end

    end # class Parser
  end # module DBLP
end # module Resea
