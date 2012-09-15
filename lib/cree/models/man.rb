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

BUG = <<EOF
 ------
| 0  0 |
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
          :duration => 0.1,
          :next_frame => 0
        },
        {
          :text => BUG,
          :duration => 0.2,
          :next_frame => 0
        },
        {
          :text => BLINK,
          :duration => 0.3,
          :next_frame => 0
        },
       {
          :text => FACE,
          :duration => 4,
          :next_frame => 0
        },


      ]

      def render(window)
        @sprite_index ||= 0
        sprite = @@sprites[@sprite_index]
        if sprite[:next_frame] <= @frame
          @sprite_index = (@sprite_index + 1) % @@sprites.length
          sprite = @@sprites[@sprite_index]
          sprite[:next_frame] = @frame + (sprite[:duration] * @frame_rate)
        end
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
