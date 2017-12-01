# Problem we want to know if 
# ther is a path from A to F
# the graph is represented with an adjacent list

# solution: use breadth first search, make sure to track nodes that have been visited 
# to avoid loops

# Graph

# (A)--------(B)
# | \         |    
# |  \       (E)
# (C) \ 
# |   (D)
# |  /
# (F)

require 'rspec/autorun'


class Queue
  attr_accessor :arr
  def initialize
    @arr = []
  end

  def enqueue(item)
    @arr << item
  end

  def dequeue
    return nil if @arr.size == 0
    @arr.shift
  end

  def empty?
    @arr.empty?
  end
end

class Node
  attr_accessor :value, :next

  def initialize(value, next_node)
    @value = value
    @next = next_node
  end

end

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


  def bfs(startNode, endNode)
    visited = {}
    visited[startNode.value] = true

    queue = Queue.new
    queue.enqueue(startNode)

    c = 0
    loop do
      
      curr_node = queue.dequeue

      return false if curr_node == nil
      return true if curr_node.value == endNode.value

      for edge in @edges[curr_node.value]
        if !visited[edge.value]
          queue.enqueue(edge)
          visited[edge.value] = true
        end
      end
    end
  end
end


describe Graph do
  subject { described_class.new }
  let(:nodeA) { Node.new('A', nil) }
  let(:nodeB) { Node.new('B', nil) }
  let(:nodeC) { Node.new('C', nil) }
  let(:nodeD) { Node.new('D', nil) }
  let(:nodeE) { Node.new('E', nil) }
  let(:nodeF) { Node.new('F', nil) }

  describe '#bfs' do
    
    before do
      subject.add_node(nodeA)
      subject.add_node(nodeB)
      subject.add_node(nodeC)
      subject.add_node(nodeD)
      subject.add_node(nodeE)
      subject.add_node(nodeF)
      subject.add_edge(nodeA, nodeB)
      subject.add_edge(nodeA, nodeC)
      subject.add_edge(nodeA, nodeD)

      subject.add_edge(nodeC, nodeF)
      subject.add_edge(nodeD, nodeF)

      subject.add_edge(nodeB, nodeE)
    end
    
    it { expect(subject.bfs(nodeA, nodeF)).to eq true }

    context 'when there is no path' do
      before do
        subject.add_node(nodeA)
        subject.add_node(nodeB)
        subject.add_node(nodeC)
        subject.add_node(nodeD)
        subject.add_node(nodeE)
        subject.add_node(nodeF)

        subject.add_edge(nodeA, nodeC)
        subject.add_edge(nodeA, nodeD)
  
        subject.add_edge(nodeC, nodeF)
        subject.add_edge(nodeD, nodeF)
  
        subject.add_edge(nodeB, nodeE)
      end

      it { expect(subject.bfs(nodeA, nodeE)).to eq false }
    end
  end
end

