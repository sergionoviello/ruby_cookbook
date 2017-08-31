class Colleague
  attr_accessor :code

  def initialize(mediator)
    @mediator = mediator
    @mediator.add_colleague(self)
  end

  def buy_offer(stock, shares)
    @mediator.offer(stock, shares, @code, :buy)
  end

  def sell_offer(stock, shares)
    @mediator.offer(stock, shares, @code, :sell)
  end
end
