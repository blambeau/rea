module Resea
  class Command
    module Utils

      DEFAULT_INFO = {
        :title   => "[Unknown title]",
        :authors => ["[Unknown author]"],
        :year    => "[Unknown year]",
        :key     => "[Unknown key]",
        :source  => "[Unknown source]",
      }

      def pretty(rel, keep = nil)
        keep ||= [:code, :key, :author, :title, :year, :source]
        Relation(rel).
          defaults(DEFAULT_INFO).
          extend(:authors => lambda{
            authors.empty? ? ["[Unknown author]"] : authors
          }).
          extend(
            :code   => lambda{ authors.first.split(/\s/).last + year.to_s },
            :title  => lambda{ title[0..50]  },
            :author => lambda{ authors.first }
          ).project(keep)
      rescue
        Relation(rel).project(keep)
      end

    end # module Utils
  end # class Command
end # module Resea
