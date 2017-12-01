
class Queue
  def initialize
    self.clear
  end

  def size
    @array.size
  end

  def empty?
    @array.empty?
  end

  def enqueue item
    @array.push item
  end

  def dequeue
    raise 'error' if self.size == 0
    @array.shift
  end

  def top
    @array.first
  end

  def bottom
    @array.last
  end

  def clear
    @array = Array.new
  end
end

# st = DataStructures::Queue.new
# puts st.empty?
# st.enqueue(2)
# st.enqueue(4)
# st.enqueue(5)
#
# puts st.top
#
# st.dequeue
# st.dequeue
#
# puts st.top
