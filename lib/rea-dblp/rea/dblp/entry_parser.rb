module Rea
  module DBLP
    class EntryParser < Parser

      def parse_text(entry, source = nil)
        entries = []
        parse_xml(entry, source) do |doc|
          doc.xpath("/dblp/*").each do |entry|
            entries << send(:"parse_#{entry.name}", entry)
          end
        end
        entries
      end

      private

      ###

      def parse_inproceedings(entry)
        { :kind       => "inproceedings",
          :key        => work_key(entry.attribute("key").text),
          :title      => entry.xpath("title").text,
          :source     => entry.xpath("booktitle").text,
          :year       => entry.xpath("year").text,
          :authors    => entry.xpath("author").map(&:text) }
      end

      def parse_article(entry)
        { :kind       => "article",
          :key        => work_key(entry.attribute("key").text),
          :title      => entry.xpath("title").text,
          :source     => entry.xpath("journal").text,
          :year       => entry.xpath("year").text,
          :authors    => entry.xpath("author").map(&:text) }
      end

      def parse_queryentry(entry)
        { :kind       => entry.xpath('type').text,
          :key        => work_key(entry.attribute("key").text),
          :title      => entry.xpath("title").text,
          :source     => entry.xpath("venue").text,
          :year       => entry.xpath("year").text,
          :authors    => entry.xpath("authors/author").map(&:text) }
      end

    end # class EntryParser
  end # module DBLP
end # module Rea
