module Rea
  module DBLP
    class Search
      include DBLP

      def call(query)
        unless query.size == 1 and query[:title]
          not_implemented_error!("Unable to search with #{query.inspect}")
        end
        title  = query[:title].gsub(/\s+/, "%20")
        xml    = get("#{search_url}?q=#{title}")
        tuples = QueryResultParser.parse(xml)
        Relation(tuples)
      end

    end # class Search
  end # module DBLP
end # module Rea
