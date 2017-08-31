require_relative 'circle'
require_relative 'square'
require_relative 'rectangle'

class ShapeFactory
    def get_shape(shape)
        case shape
        when 'CIRCLE'
            Circle.new
        when 'SQUARE'
            Square.new
        when 'RECTANGLE'
            Rectangle.new
        end
    end
end