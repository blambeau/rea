module Resea

  class Error < StandardError
    attr_reader :cause
    def initialize(msg, cause = $!)
      super(msg)
      @cause = cause
    end
  end

  class SystemError < Error
  end
  class ParseFormatError < SystemError; end

  class DomainError < Error
  end
  class ParseError      < DomainError; end
  class NotFoundError   < DomainError; end
  class ThirdPartyError < DomainError; end
  class UsageError      < DomainError; end

  module ErrorUtils

    def error_message(msg, source = nil, cause = $!)
      msg = msg.dup
      msg << " #{source}" if source
      msg << ", #{cause.message}" if cause
      msg
    end

    def parse_error!(source)
      msg = error_message("Error while parsing", source)
      raise Resea::ParseError, msg
    end

    def third_party_error!(source)
      msg = error_message("Error with third party service", source)
      raise Resea::ThirdPartyError, msg
    end

    def not_found_error!(source)
      msg = error_message("Unable to find", source)
      raise Resea::NotFoundError, msg
    end

    def parse_format_error!(source)
      msg = error_message("Unexpected parsing error (#{source})")
      raise Resea::ParseFormatError, msg
    end

    def unexpected_error!(source)
      msg = error_message("Unexpected error (#{source})")
      raise Resea::SystemError, msg
    end

  end
end # module Resea
