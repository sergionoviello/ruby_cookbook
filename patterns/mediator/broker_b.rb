require_relative 'colleague'

class BrokerB < Colleague
  def initialize(mediator)
    super(mediator)
  end
end
