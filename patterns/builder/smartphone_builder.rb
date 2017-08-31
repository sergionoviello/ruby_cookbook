require_relative 'cpu'
require_relative 'smartphone'

class SmartphoneBuilder
  attr_reader :smartphone

  def initialize
    @smartphone = Smartphone.new
  end

  def set_model(model)
    @smartphone.model = model
  end

  def add_processor(speed)
    @smartphone.cpu = Cpu.new(speed)
  end

  def add_memory(amount)
    @smartphone.memory = amount
  end

  def computer
    @smartphone
  end
end
