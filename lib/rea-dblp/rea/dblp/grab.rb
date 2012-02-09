module Rea
  module DBLP
    class Grab
      include DBLP

      def call(identifier)
        xml    = get entry_url(identifier)
        tuples = EntryParser.parse(xml)
        tuples.first
      end

    end # class Grab
  end # module DBLP
end # module Rea
