require 'resea'
module Resea
  #
  # resea - The RESearch Exploring Assistant
  #
  # SYNOPSIS
  #   #{program_name} [--version] [--help] COMMAND [cmd opts] ARGS...
  #
  # OPTIONS
  # #{summarized_options}
  #
  # COMMANDS
  # #{summarized_subcommands}
  #
  # See '#{program_name} help COMMAND' for more information on a specific command.
  #
  class Command < Quickl::Delegator(__FILE__, __LINE__)

    # Install options
    options do |opt|
      @trace = false
      opt.on('--trace') do
        @trace = true
      end
      opt.on_tail("--help", "Show help") do
        raise Quickl::Help
      end
      opt.on_tail("--version", "Show version") do
        raise Quickl::Exit, 
              "resea #{Resea::VERSION} (c) 2012, Bernard Lambeau"
      end
    end

    def execute(*args)
      super
    rescue Quickl::Error
      raise
    rescue Resea::Error => ex
      if @trace
        dump_exception(ex)
      else
        $stderr.puts ex.message
      end
    rescue Exception => ex
      puts "Sorry, an internal error occured. Please report --trace to developers."
      dump_exception(ex) if @trace
    end

    private

    def dump_exception(ex, indent = 0)
      $stderr.puts ex.message.gsub(/^/m,"  "*indent)
      $stderr.puts ex.backtrace.map{|s|
        s.gsub(/^/m,"  "*(indent+1))
      }.join("\n")
      dump_exception(ex.cause, indent + 1) if ex.respond_to?(:cause)
    end

  end # class Command
end # module Resea
require_relative "command/utils"
require_relative "command/search"
