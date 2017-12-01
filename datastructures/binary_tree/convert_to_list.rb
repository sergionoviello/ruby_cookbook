class Node
  attr_accessor :value, :left, :right

  def initialize(val)
    @value = val
    @left = nil
    @right = nil
  end
end


def convert(root, head)
  return if root == nil

  prev = nil

  convert(root.left, head)

  if prev == nil
    head = root
  else
    root.left = prev
    prev.right = root
  end

  prev = root

  convert(root.right, head)
  head
end

head = nil
root = Node.new(10)
lnode = Node.new(12)
root.left = lnode
root.right = Node.new(15)

lnode.left = Node.new(25)
lnode.right = Node.new(30)

h = convert(root, head)

p h