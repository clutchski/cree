require 'curses'


module Cree
  class View

    def initialize(logger)
      Curses::noecho
      Curses::curs_set 0
      #Curses::cbreak
      @window = Curses::Window.new(0, 0, 0, 0)
      @window.keypad true
      @logger = logger
      @keys_to_commands = {
        'q' => :quit,
        'm' => :move,
        258 => :down,
        259 => :up,
        260 => :left,
        261 => :right
      }
    end


    # Clear the screen
    def clear
      @window.clear
    end

    def render(models)
      models.each{|m| m.render @window}
    end

    # Close the window.
    def close
      @window.close
    end

    def get_command
      command = nil
      while not command
        ch = @window.getch
        @logger.debug "pressed #{ch}"
        command = @keys_to_commands[ch]
      end
      command
    end

  end
end
