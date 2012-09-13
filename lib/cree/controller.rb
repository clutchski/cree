
require 'logger'

require_relative 'view'
require_relative 'model'

module Cree
  class Controller

    def initialize
      @logger = Logger.new('cree.log')
      @continue = false
      @view = View.new @logger

      @man =  Model.new
      @elements = [@man]
    end

    def run
      @continue = true
      while @continue
        command = @view.get_command
        self.process_command command
        self.update_world
        self.update_view
      end
    end

    def update_world
    end

    def update_view
      @view.clear
      @view.render @elements
    end

    def process_command(command)
      @logger.info "recieved command #{command}"
      case command
      when :quit
        @continue = false
      when :up, :down, :left, :right
        @man.send command
      end
    end

  end
end
