class BurgerDecorator < SimpleDelegator
  def initialize(burger)
    @burger = burger
    super
  end
end
