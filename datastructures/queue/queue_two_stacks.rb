class Stack
  attr_accessor :arr

  def initialize
    @arr = []
  end

  def push(item)
    @arr.push(item)
  end

  def pop
    raise 'errr' if size  == 00
    @arr.pop
  end
  
  def size
    @arr.size
  end

  def empty?
    @arr.size == 0
  end
end


class QueueWithStacks
  attr_accessor :input, :output
  def initialize
    @input = Stack.new
    @output = Stack.new
  end

  def enqueue(val)
    @input.push(val)
  end

  def dequeue
    if @output.empty?
      while !@input.empty?
        @output.push(@input.pop)
      end
    end
    @output.pop
  end

  def show
    p @output.arr
  end
end

q = QueueWithStacks.new
q.enqueue(4)
q.enqueue(5)
q.enqueue(6)

p q.dequeue

# s.push(3)
# s.push(4)
# s.pop
# s.push(5)
# p s.arr