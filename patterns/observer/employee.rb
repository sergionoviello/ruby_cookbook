require_relative 'subject'

class Employee
  include Subject

  attr_reader :name, :salary

  def initialize(name, salary)
    initialize_extra
    @name = name
    @salary = salary
  end

  def salary=(new_salary)
    @salary = new_salary
    notify_observers
  end
end
