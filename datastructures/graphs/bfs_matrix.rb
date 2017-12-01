# Problem we want to know if 
# ther is a path from A to F
# the graph is represented with an adjacent matrix

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


class Graph
  attr_accessor :graph_representation

  def initialize(graph_representation)
    @graph_representation = graph_representation
  end

  def bfs(start, enditem)
    visited = {}
    visited[start] = true
    
    queue = Queue.new
    queue.enqueue(start)

    loop do
      curr_node = queue.dequeue

      return false if curr_node == nil
      return true if curr_node == enditem
    
      for i in 0..@graph_representation.size - 1
        if !visited.key?(i) && @graph_representation[curr_node][i] == 1
          queue.enqueue(i) 
          visited[i] = true
        end
      end
    end
  end
end



describe Graph do
  subject{ described_class.new(matrix) }

  describe '#bfs' do
    let(:matrix) do
      [
        [0, 1, 1, 1, 0, 0], # A
        [1, 0, 0, 0, 1, 0], # B
        [1, 0, 0, 0, 0, 1], # C,
        [1, 0, 0, 0, 0, 1], # D,
        [0, 1, 0, 0, 0, 0], # E,
        [0, 0, 1, 1, 0, 0]  # F
      ] 
    end

    context 'when path exists between A and F' do
  
      it { expect(subject.bfs(0, 5)).to eq true }
    end

    context 'when path does not exists between A and E' do
      let(:matrix) do
        [
          [0, 0, 1, 1, 0, 0], # A
          [0, 0, 0, 0, 1, 0], # B
          [1, 0, 0, 0, 0, 1], # C,
          [1, 0, 0, 0, 0, 1], # D,
          [0, 1, 0, 0, 0, 0], # E,
          [0, 0, 1, 1, 0, 0]  # F
        ] 
      end
      it { expect(subject.bfs(0, 4)).to eq false }
    end
  end
end