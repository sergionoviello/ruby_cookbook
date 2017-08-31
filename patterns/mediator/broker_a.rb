require_relative 'colleague'

class BrokerA < Colleague
  def initialize(mediator)
    super(mediator)
  end
end
