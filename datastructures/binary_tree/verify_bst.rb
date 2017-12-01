# build a binary search tree and verify that is valid

class Node
  attr_accessor :val, :left, :right

  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end


class Tree
  attr_accessor :root

  def initialize(val=nil)
    @root = Node.new(val)
  end
  
  def insert(val)
    if @root.nil?
      @root = Node.new(val)
    else
      insert_at_node(@root, val)
    end
  end

  def insert_at_node(node, val)
    if val < node.val
      node.left.nil? ? node.left = Node.new(val) : insert_at_node(node.left, val)
    elsif val > node.val
      node.right.nil? ? node.right = Node.new(val) : insert_at_node(node.right, val)
    end
  end

  def is_valid?(node, min=-9999999999999, max = 9999999999999)
    return true if node.nil?

    if node.val < min || node.val > max
      return false
    end


    return is_valid?(node.left, min, node.val-1) && is_valid?(node.right, node.val+1, max) 

  end
end


t = Tree.new(80)
t.root.left = Node.new(30)
t.root.right = Node.new(90)


p t.is_valid?(t.root)