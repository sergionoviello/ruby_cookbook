require_relative 'task'

class BakeTask < Task
  def initialize
    super 'Bake'
  end

  def time_required
    1
  end
end
