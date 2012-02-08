module Resea
  module DBLP

    def grab(identifier)
      Grab.new.call(identifier)
    end
    module_function :grab

    private

    include Resea::ErrorUtils

    def url
      "http://www.dblp.org"
    end

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

  end # module DBLP
end # module Resea
require_relative 'dblp/parser'
require_relative 'dblp/entry_parser'
require_relative 'dblp/query_result_parser'
require_relative 'dblp/grab'

