require_relative 'stock_mediator'
require_relative 'broker_a'
require_relative 'broker_b'

mediator = StockMediator.new

broker_a = BrokerA.new(mediator)
broker_b = BrokerB.new(mediator)

broker_a.buy_offer('APPL', 50)
broker_b.sell_offer('APPL', 20)
broker_a.buy_offer('GOOG', 20)
broker_b.sell_offer('NRG', 10)
