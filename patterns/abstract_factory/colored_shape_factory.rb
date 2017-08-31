require_relative 'red_square_factory'
require_relative 'green_circle_factory'


class ColoredShapeFactory
    def get_factory(type)
        case type
        when 'RedSquare'
            RedSquareFactory.new
        when 'GreenCircle'
            GreenCircleFactory.new
        end
    end
end