# Problem we want to know if 
# ther is a path from A to F
# the graph is represented with an adjacent matrix

# solution: use depth first search, make sure to track nodes that have been visited 
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

class Stack
  attr_accessor :arr
  def initialize
    @arr = []
  end

  def push(item)
    @arr << item
  end

  def pop
    return nil if @arr.size == 0
    @arr.pop
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

  def dfs(start, enditem)
    visited = {}
    visited[start] = true
    
    stack = Stack.new
    stack.push(start)

    loop do
      curr_node = stack.pop

      return true if curr_node == enditem
      return false if curr_node == nil

      for i in 0..@graph_representation.size - 1
        if !visited.key?(i) && @graph_representation[curr_node][i] == 1
          stack.push(i) 
          visited[i] = true
        end
      end
    end
  end
end



describe Graph do
  subject{ described_class.new(matrix) }

  describe '#dfs' do
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
  
      it { expect(subject.dfs(0, 5)).to eq true }
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
      it { expect(subject.dfs(0, 4)).to eq false }
    end
  end
end