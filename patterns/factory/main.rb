require_relative 'shape_factory'



square_factory = ShapeFactory.new
circle = square_factory.get_shape('CIRCLE')
circle.draw