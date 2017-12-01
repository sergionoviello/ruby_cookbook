class Element
  include Comparable

  attr_accessor :val, :priority

  def initialize(val, priority)
    @val, @priority = val, priority
  end

  def <=> (other)
    @priority <=> other.priority 
  end
end


class NaivePriorityQueue
  def initialize
    @arr = []
  end

  def add(element)
    @arr << element
  end

  def pop
    last_index = @arr.size - 1
    @arr.sort!
    @arr.delete_at(last_index)
  end
end

q = NaivePriorityQueue.new
q.add Element.new('a', 1)
q.add Element.new('b', 5)
q.add Element.new('c', 3)

p q.pop