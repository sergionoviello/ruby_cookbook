# There is a doubly linked list with next pointer and random pointer (points to an arbitrary node in list). You have to make a copy of the linked list and return. 
# In the end original list shouldn't be modified. 
# Time complexity should be O(n).

class Node
  attr_accessor :val, :next, :random

  def initialize(val)
    @val = val
  end


end

a = Node.new('A')
d = Node.new('D')
g = Node.new('G')

a.next = d
a.random = g

d.next = g
d.random = a

g.next = nil
g.random = d


a2 = Node.new('A2')
d2 = Node.new('D2')
g2 = Node.new('G2')

a2.random = g
d2.random = a
g2.random = d

# A -> D -> G

a.next = a2
a2.next = d

d.next = d2
d2.next  = g

g.next = g2
g2.next = nil


curr = a
while curr != nil
  curr.next.random = curr.random.next
  curr = curr.next.next
end

curr = a
copy = a.next
while curr != nil && copy != nil
  curr.next = curr.next.next
  curr = curr.next
  if (copy.next != nil)
    copy.next = copy.next.next
    copy = copy.next
  end
end



curr = a2
while curr != nil
  p curr.val
  curr = curr.next
end
