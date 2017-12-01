module DataStructures
  class Stack
    def initialize
      self.clear
    end

    def size
      @array.size
    end

    def empty?
      @array.empty?
    end

    def push item
      @array.push item
    end

    def pop
      raise 'error' if self.size == 0
      @array.pop
    end

    def top
      @array.last
    end

    def bottom
      @array.first
    end

    def clear
      @array = Array.new
    end
  end
end

# st = DataStructures::Stack.new
# puts st.empty?
# st.push(2)
# st.push(4)
# st.push(5)
#
# st.pop
# puts st.top
