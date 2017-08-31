module DataStructures
  class Node
    attr_accessor :value, :left, :right

    def initialize(value=nil)
      @value = value
      @left = nil
      @right = nil
    end
  end

  class BinarySearchTree
    attr_accessor :root_node

    def initialize(root_value=nil)
      @root_node = Node.new(root_value)
    end

    def insert(value)
      if @root_node.nil?
        @root_node = Node.new(value)
      else
        insert_at_node(@root_node, value)
      end
    end

    def insert_at_node(node, value)
      if value <= node.value
        node.left.nil? ? node.left = Node.new(value) : insert_at_node(node.left, value)
      elsif value > node.value
        node.right.nil? ? node.right = Node.new(value) : insert_at_node(node.right, value)
      end
    end

    def valid_BST?(node, min=-1.0/0.0, max=1.0/0.0)
      if node.nil?
        return true
      end

      if node.value < min || node.value > max
        return false
      end

      return valid_BST?(node.left, min, node.value - 1) && valid_BST?(node.right, node.value+1, max)
    end

    def search(value, node)
      return nil if node.nil?

      if value == node.value
        return node
      elsif value < node.value
        search(value, node.left)
      else value > node.value
        search(value, node.right)
      end
    end

    def delete(value)
      node = search(value, @root_node)
      remove(node) unless node.nil?
    end

    def remove(node)
      if node.left.nil? && node.right.nil?
        node = nil
      elsif node.left != nil && node.right.nil?
        node = node.left
      elsif node.right != nil && node.left.nil?
        node = node.right
      else
        node = delete_node_with_children(node)
      end
      node
    end

    def delete_node_with_children(node)
      min_node = find_min_node(node.right)
      node.value = min_node.value
      min_node = nil
    end

    def find_min_node(node)
      if node.left.nil?
        return node
      else
        find_min_node(node.left)
      end
    end
  end
end
