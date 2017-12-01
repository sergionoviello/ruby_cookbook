
#  1    <-- root
#  /   \
# 2     3  
# /   
# 4

require 'rspec/autorun'

class Node
  attr_accessor :value, :left, :right

  def initialize(val)
    @value = val
    @left = nil
    @right = nil
  end
end

describe Node do
  subject { described_class.new(root) }

  let(:root) { Node.new(1) }

  before do    
    node2 = Node.new(2)
    root.left = node2
    root.right = Node.new(3)
    node2.left = Node.new(4)
  end

  it { expect(root.left.left.value).to eq 4 }
  it { expect(root.right.value).to eq 3 }
end



