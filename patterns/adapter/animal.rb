class Animal
  module Adapter
    module Dog
      def self.speak
        puts 'bark'
      end
    end

    module Cat
      def self.speak
        puts 'miaaao'
      end
    end
  end

  def adapter
    return @adp if @adp
    self.adapter = :dog
    @adp
  end

  def adapter=(adapter)
    @adp = Animal::Adapter.const_get(adapter.to_s.capitalize)
  end

  def speak
    self.adapter.speak
  end
end
