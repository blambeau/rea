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

end # module Resea

require_relative 'resea/work_key'
require_relative 'resea-dblp/resea/dblp'
