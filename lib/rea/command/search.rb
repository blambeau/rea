module Rea
  class Command
    #
    # Search publications on the online libraries
    #
    # SYNOPSIS
    #   #{command_name} [options] ARG
    #
    # OPTIONS
    # #{summarized_options}
    #
    class Search < Quickl::Command(__FILE__, __LINE__)
      include Utils

      # Install options
      options do |opt|
        @provider = Rea::providers.first
        @mainarg = :title
        @query   = {}
        Rea::providers.each do |p|
          opt.on("--#{p.shortcut}", "Search on #{p.url}"){ 
            @provider = p
          }
        end
        opt.on("--title=[TITLE]", "Specify the publication title"){|title|
          if title
            @query[:title] = title
          else
            @mainarg = :title
          end
        }
        @keep = nil
        opt.on("--show=a,b,c", 
               "Only show a, b, and c attributes", Array) do |list|
          @keep = list.map(&:to_sym)
        end
      end

      def run(*args)
        puts pretty(super, @keep)
      end

      # Run the command
      def execute(args)
        raise Quickl::Help if args.size > 1
        @query[@mainarg] = args.first if args.size == 1
        @provider.search(@query)
      end

    end # class Search
  end # class Command
end # module Rea
