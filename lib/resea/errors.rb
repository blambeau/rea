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
  class UnrecognizedError < SystemError; end

  class DomainError < Error
  end
  class NotFoundError     < DomainError; end
  class UsageError        < DomainError; end

end # module Resea
