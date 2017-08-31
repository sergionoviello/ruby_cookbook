require_relative 'burger_decorator'

class LargeBurger < BurgerDecorator
  def initialize(burger)
    @burger = burger
  end

  def cost
    @burger.cost + 10
  end
end
