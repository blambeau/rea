require_relative "rea/version"
require_relative "rea/loader"
require_relative "rea/errors"

#
# Research Exploring Assistant
#
module Rea

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

end # module Rea

require_relative 'rea/work_key'
require_relative 'rea-dblp/rea/dblp'
