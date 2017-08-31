class Smartphone
  attr_accessor :model, :cpu, :memory
  
  def initialize(model = nil, cpu = nil, memory = nil)
    @model = model
    @cpu = cpu
    @memory = memory
  end
end
