class AbstractFactory
    def get_color
        raise NotImplementedError
    end
    def get_shape(shape)
        raise NotImplementedError
    end
end