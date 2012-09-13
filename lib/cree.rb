#
# Cree
#


require_relative 'cree/controller'


module Cree

  VERSION = "0.0.1"

end

if __FILE__ == $0
  controller = Cree::Controller.new
  controller.run
end
