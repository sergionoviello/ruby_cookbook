require_relative 'task'

class CompositeTask < Task
  def initialize(name)
    super(name)
    @sub_tasks = []
  end

  def add_sub_task(task)
    @sub_tasks << task
    task.parent = self
  end

  def [](index)
    @sub_tasks[index]
  end

  def []=(index, value)
    replaced = @sub_tasks[index]
    @sub_tasks[index] = value
    replaced.parent = nil
    value.parent = self
  end

  def time_required
    time = 0
    @sub_tasks.each { |t| time += t.time_required }
    time
  end
end
