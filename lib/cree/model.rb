module Cree

  class Model
    def initialize
      @x = 0
      @y = 0
    end

    def move
      @x += 1
      @y += 1
    end

    def up
      @y -= 1
    end

    def down
      @y += 1
    end

    def left
      @x -= 1
    end

    def right
      @x += 1
    end

    def render(window)
      window.setpos @y, @x
      window.insch 'a'
    end
  end

end
