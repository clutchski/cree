require 'curses'


module Cree
  module Models

    # A base class for things that are rendered on the
    # screen
    class Model

      attr_accessor :frame

      def initialize(options={})
        @x = options[:x] || 0
        @y = options[:y] || 0
        @frame = options[:frame] || 0
        @frame_rate = options[:frame_rate] || 1
      end

      def render(window)
        # Override.
      end

      protected

      def render_sprite(window, sprite, options={})
        x = options[:x] || @x
        y = options[:y] || @y
        sprite.split("\n").each_with_index do |line, i|
          window.setpos(y + i, x)
          window.addstr line
        end
      end

    end
  end
end
