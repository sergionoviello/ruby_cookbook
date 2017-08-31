class Command
  attr_reader :description

  def initialize(desc)
    @description = desc
  end

  def execute
    raise NotImplementedError
  end

  def unexecute
    raise NotImplementedError
  end
end
