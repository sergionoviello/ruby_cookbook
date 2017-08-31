require_relative '../datastructures/binary_tree'
require_relative '../datastructures/stack'

class TernaryToTree
  attr_accessor :root
  def initialize(str)
    @str = str
    stack = DataStructures::Stack.new
    @root = DataStructures::Node.new(@str[0])
    stack.push(@root)

    (1..@str.length).step(2) do |i|
      operator = @str[i]
      next_char = @str[i + 1]
      node = DataStructures::Node.new(next_char)
      if operator == '?'
        stack.top().left = node
      end

      if operator == ':'
        stack.pop()
        while(stack.top().right != nil)
          stack.pop()
        end
        stack.top().right = node
      end

      stack.push(node)
    end
  end

  def inorder_tree(node, result)
    unless node.nil?
        inorder_tree(node.left, result)
        result << node.data
        inorder_tree(node.right, result)
    end
  end
end

res = []
t = TernaryToTree.new("a?b?c:d:e")
t.inorder_tree(t.root, res)

print res
