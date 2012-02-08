require_relative "resea/version"
require_relative "resea/loader"
require_relative "resea/errors"

#
# Research Exploring Assistant
#
module Resea

  def WorkKey(str)
    WorkKey.parse(str)
  end
  module_function :WorkKey

  def register_provider(provider)
    providers << provider
  end
  module_function :register_provider

  def providers
    @providers ||= []
  end
  module_function :providers

end # module Resea

require_relative 'resea/work_key'
require_relative 'resea-dblp/resea/dblp'
