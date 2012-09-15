require_relative 'model'

module Cree
  module Models
    class Man < Model

      @@sprite = <<EOF
 -----
| o o |
|     |
|  =  | 
 -----
EOF

      def render(window)
        render_sprite(window, @@sprite)
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