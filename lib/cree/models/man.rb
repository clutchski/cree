require_relative 'model'

FACE = <<EOF
 ------
| o  o |
|      |
|  __  |
|      |
 ------
EOF

BLINK = <<EOF
 ------
| -  - |
|      |
|  __  |
|      |
 ------
EOF




module Cree
  module Models

    class Man < Model

      @@sprites = [
        {
          :text => BLINK,
          :duration => 0.1
        },
        {
          :text => FACE,
          :duration => 0.4
        }
      ]

      def render(window)
        @lastChange = @lastChange || @frame
        if @frame 
        sprite = @@sprites[(@frame % 50) < 3 ? 0 : 1]

        render_sprite(window, sprite[:text])
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
    end
  end
end