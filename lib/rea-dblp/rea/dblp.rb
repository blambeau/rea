module Rea
  module DBLP

    def grab(identifier)
      Grab.new.call(identifier)
    end
    module_function :grab

    def search(query)
      Search.new.call(query)
    end
    module_function :search

    def url
      "http://www.dblp.org"
    end
    module_function :url

    def shortcut
      "dblp"
    end
    module_function :shortcut

    private

    include Rea::ErrorUtils

    def entry_url(identifier)
      "#{url}/rec/bibtex/#{identifier}.xml"
    end

    def search_url
      "#{url}/search/api"
    end

    def get(url)
      got = Http.get(url, :response => :object)
      case got.status
      when 200...300
        not_found_error!(url) if got.body.empty?
        got.body
      when 400...500
        not_found_error!(url)
      when 500...600
        third_party_error!(url)
      else
        unexpected_error!(url)
      end
    end

    Rea::register_provider(self)
  end # module DBLP
end # module Rea
require_relative 'dblp/parser'
require_relative 'dblp/entry_parser'
require_relative 'dblp/query_result_parser'
require_relative 'dblp/grab'
require_relative 'dblp/search'

