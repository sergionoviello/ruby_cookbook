require_relative 'queue'

module DataStructures

  # Implements a queue in which elements can be removed and added
  # at both the front and back, using an array container.


  class Deque < Queue
    def front_enqueue item
      @array.unshift item
    end

    def back_dequeue item
      @array.pop item
    end
  end
end

# st = DataStructures::Deque.new
# st.enqueue(2)
# st.enqueue(4)
# st.enqueue(5)
#
#
# st.front_enqueue(10)
# st.back_enqueue(1)
#
# puts st.top
# puts st.bottom
