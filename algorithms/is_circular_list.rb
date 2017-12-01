# verify if a linked list is circular, which means
#one node points to an existing node
class Node
  attr_accessor :value, :next

  def initialize(value, next_node)
    @value = value
    @next = next_node
  end
end


class LinkedList
  attr_accessor :head
  def initialize(val)
    @head = Node.new(val, nil)
  end

  def is_loop?()
    curr = @head

    passed = []
    c = 0
    while curr.next != nil && c < 10
      passed << curr.value
      curr = curr.next
      c += 1

      if passed.include?(curr.value)
        return true
      end
    end

    return false
  end
end


l = LinkedList.new(1)
node1 = Node.new(2, nil)
# l.head.next = node1
# l.head.next.next = Node.new(3, nil)
# l.head.next.next.next = node1

l.head.next = node1
l.head.next.next = Node.new(3, nil)

p l.is_loop?