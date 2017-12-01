# Represent a graph with a linked list
# It takes less space than the adjacent matrix
# To find if there is a relationship we need to traverse the list

# Graph

# (A)--------(B)
# | \         |    
# |  \       (E)
# (C) \ 
# |   (D)
# |  /
# (F)

require 'rspec/autorun'


# class LinkedList
#   attr_accessor :head

#   def initialize(val)
#     @head = Node.new(val, nil)
#   end

#   def add(val)
#     current = @head

#     while current.next != nil
#       current = current.next
#     end

#     current.next = Node.new(val, nil)
#   end
# end


class Node
  attr_accessor :value, :next

  def initialize(value, next_node)
    @value = value
    @next = next_node
  end

end

class Graph
  attr_accessor :nodes, :edges
  
  def initialize
    @nodes = {}
    @edges = {}
  end

  def add_node(node)
    @nodes[node.value] = node
    @edges[node.value] = []
  end

  def add_edge(nodeA, nodeB)
    @edges[nodeA.value] << nodeB
  end

  def relationship?(nodeA, nodeB)
    @edges[nodeA.value].include?(nodeB)
  end

end


describe Graph do
  subject { described_class.new }
  let(:nodeA) { Node.new('A', nil) }
  let(:nodeB) { Node.new('B', nil) }
  let(:nodeC) { Node.new('C', nil) }

  describe '#relationship?' do
    
    before do
      subject.add_node(nodeA)
      subject.add_node(nodeB)
      subject.add_node(nodeC)
      subject.add_edge(nodeA, nodeB)
    end
    
    it 'returns true' do
      expect(subject.relationship?(nodeA, nodeB)).to eq true
    end

    it 'returns false' do
      expect(subject.relationship?(nodeA, nodeC)).to eq false
    end
  end
end

