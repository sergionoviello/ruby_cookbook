require_relative 'circle'
require_relative 'green'
require_relative 'abstract_factory'

class GreenCircleFactory < AbstractFactory
    def get_shape
        Circle.new
    end

    def get_color
        Green.new
    end
end