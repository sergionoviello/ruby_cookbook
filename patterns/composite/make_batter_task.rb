require_relative 'task1'
require_relative 'task2'
require_relative 'composite_task'

class MakeBatterTask < CompositeTask
  def initialize
    super 'make batter task'
    @sub_tasks = []
    add_sub_task(Task1.new)
    add_sub_task(Task2.new)
  end

  def time_required
    1
  end
end
