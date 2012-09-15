require 'curses'


module Cree
  class View

    def initialize(logger)
      Curses::init_screen
      Curses::noecho 
      Curses::curs_set 0
      @window = Curses::Window.new(0, 0, 0, 0)
      @window.keypad true
      @window.timeout = 0 # Don't block waiting for input

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

    # Return the given user command, or nil if no command
    # was issued.
    def get_command
      ch = @window.getch
      return nil unless ch

      @logger.debug "pressed #{ch}"
      @keys_to_commands[ch]
    end

  end
end
