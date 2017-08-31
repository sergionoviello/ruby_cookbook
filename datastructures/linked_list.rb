module DataStructures
  class Node
    attr_accessor :value, :next

    def initialize(value, next_node)
      @value = value
      @next = next_node
    end
  end


  class LinkedList
    def initialize(val)
      @head = Node.new(val, nil)
    end

    def add(val)
      current = @head
      while current.next != nil
        current = current.next
      end

      current.next = Node.new(val, nil)
    end

    def delete(val)
      current = @head
      if current.value == val
        @head = current.next
      else
        while (current.next != nil) && (current.next.value != val)
          current = current.next
        end

        unless current.next == nil
          current.next = current.next.next
        end
      end
    end

    def return_list
      res = []
      current = @head
      while current.next != nil
        res << current.value
        current = current.next
      end
      res << current.value
    end
  end
end


# ll = DataStructures::LinkedList.new 5
# ll.add 10
# ll.add 2
# ll.add 4
# ll.add 1
# ll.delete 10
# puts ll.return_list
