
require 'logger'

require_relative 'view'
require_relative 'models/man'

module Cree
  class Controller

    def initialize
      @logger = Logger.new('cree.log')

      # Initialize the engine.
      @frame = 0
      @sleep = 0.05
      @frame_rate = 1 / @sleep
      @continue = nil

      @logger.info("Starting game frame_rate:#{@frame_rate}")

      # Initialize the view
      @view = View.new @logger

      # Initialize our models
      @man =  Models::Man.new

      # All the things we'll draw.
      @models = [@man]
    end

    def run
      @continue = true
      while @continue
        cmd = @view.get_command
        self.process_command cmd if cmd
        self.update_world
        self.update_view

        # let something else use the cpu
        @frame += 1
        sleep @sleep
      end
    end

    def update_world
      @models.each {|m| m.frame = @frame}
    end

    def update_view
      @view.clear
      @view.render @models
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
