require_relative 'square'
require_relative 'red'
require_relative 'abstract_factory'

class RedSquareFactory < AbstractFactory
    def get_shape
        Square.new
    end

    def get_color
        Red.new
    end
end