module Rea
  class WorkKey

    attr_reader :provider
    attr_reader :identifier

    def initialize(provider, identifier)
      @provider, @identifier = provider, identifier
    end

    def self.parse(str)
      return str if str.is_a?(WorkKey)
      unless str.strip =~ /^([a-z]+):\/\/(.+)$/
        raise ArgumentError, "Invalid work key #{str}"
      end
      WorkKey.new($1, $2)
    end

    def ==(other)
      other.is_a?(WorkKey) and other.to_s == to_s
    end
    alias :eql? :==

    def to_s
      "#{provider}://#{identifier}"
    end

    def to_ruby_literal
      "Rea::WorkKey(#{to_s.inspect})"
    end

  end # class WorkKey
end # module Rea
