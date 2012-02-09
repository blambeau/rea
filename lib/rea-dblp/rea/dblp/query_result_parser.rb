module Rea
  module DBLP
    class QueryResultParser < Parser

      def parse_text(result, source = nil)
        entries = []
        parse_xml(result, source) do |doc|
          unrecognized!(source) if doc.xpath('/result').empty?
          doc.xpath("/result/hits/hit").each do |entry|
            entries << send(:"xml_parse_hit", entry)
          end
        end
        entries
      end

      private

      def fix_xmlns(xml)
        xml.gsub %r{<result>}, 
                 %q{<result xmlns:dblp="http://www.dblp.org/xmlns/dblp">}
      end

      def xml_parse_hit(hit)
        key = hit.xpath('url').text[%r{http://www.dblp.org/rec/bibtex/(.*)}, 1]
        content = <<-XML.gsub(/\n\s*/, "")
          <dblp>
            <queryentry key="#{key}">
              #{hit.xpath('title').inner_text}
            </queryentry>
          </dblp>
        XML
        EntryParser.parse(content).first
      end

    end # class QueryResultParser
  end # module DBLP
end # module Rea

