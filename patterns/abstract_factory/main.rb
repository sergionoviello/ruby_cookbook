require_relative 'colored_shape_factory'

colored_shape_factory = ColoredShapeFactory.new

red_square_factory = colored_shape_factory.get_factory('RedSquare')
red_square_factory.get_shape.draw
red_square_factory.get_color.fill

puts

green_circle_factory = colored_shape_factory.get_factory('GreenCircle')
green_circle_factory.get_shape.draw
green_circle_factory.get_color.fill


