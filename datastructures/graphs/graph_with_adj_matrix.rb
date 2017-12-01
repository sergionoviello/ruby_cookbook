# Represent a graph with an adj matrix. 
# When there is a relationship between index i and j we set the value to 1
# No relationship the value is 0
# It takes more space, we n nodes we need an nxn matrix. 
# To find if there is a relationship it takes O(1)

# Graph

# (A)--------(B)
# | \         |    
# |  \       (E)
# (C) \ 
# |   (D)
# |  /
# (F)


require 'rspec/autorun'


class Graph
  attr_accessor :graph_representation
  
  def initialize(graph_representation)
    @graph_representation = graph_representation
  end

  def relationship?(i, j)
    @graph_representation[i][j] == 1
  end
end

describe Graph do
  subject { described_class.new(matrix) }

  describe '#relationship?' do
    let(:matrix) do
      [
        [0, 1, 1, 1, 0, 0], # A
        [1, 0, 0, 0, 1, 0], # B
        [1, 0, 0, 0, 0, 1], # C,
        [1, 0, 0, 0, 0, 1], # D,
        [0, 1, 0, 0, 0, 0], # E,
        [0, 0, 1, 1, 0, 0] # F
      ]  
    end
    
    it 'returns true' do
      expect(subject.relationship?(0, 2)).to eq true
    end

    it 'returns false' do
      expect(subject.relationship?(0, 4)).to eq false
    end
  end
end