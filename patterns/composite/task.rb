class Task
  attr_reader :name
  attr_accessor :parent

  def initialize(name)
    @name = name
  end

  def time_required
    0
  end
end
