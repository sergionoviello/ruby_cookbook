require_relative 'queue'

module DataStructures
  class PriorityQueue < Queue
    PQNode = Struct.new(:value, :priority)

    def enqueue(item, priority=0)
      raise RangeError.new("priority greater than size") if priority > self.size
      @array.push(PQNode.new(item, priority))
      @array.sort! { |a, b| a.priority <=> b.priority }
    end

    def dequeue
      r = method(:dequeue).super_method.call
      r.nil? ? r : r.value
    end

    def top
      method(:top).super_method.call.value
    end

    def bottom
      method(:top).super_method.call.value
    end
  end
end

#
# pq = DataStructures::PriorityQueue.new
# pq.enqueue(5, 0)
# pq.enqueue(3, 0)
# puts pq.top
