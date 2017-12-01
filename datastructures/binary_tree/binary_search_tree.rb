# binary search tree are tree with the property 
# that the left node is lower than the parent 
# and a the right node is higher than the parent


require 'rspec/autorun'

class Node
  attr_accessor :value, :left, :right

  def initialize(val)
    @value = val
    @left = nil
    @right = nil
  end
end


class BST
  attr_accessor :root

  def initialize(val)
    @root = Node.new(val)
  end

  def insert(node, val)
    return Node.new(val) if node == nil 
    
    if val < node.value
      node.left = insert(node.left, val)
    elsif val > node.value
      node.right = insert(node.right, val)
    end
  end

  def search(node, val)
    
    return false if node == nil
    return true if node.value == val

    if val < node.value
      return search(node.left, val)
    else
      return search(node.right, val)
    end
  end
end

describe BST do
  subject { described_class.new(root) }

  let(:root) { 3 }

  describe '#insert' do
    before do    
      subject.insert(subject.root, 2)
      subject.insert(subject.root, 4)
    end

    it { expect(subject.root.left.value).to eq 2 }
    it { expect(subject.root.right.value).to eq 4 }
  end

  describe '#search' do
    before do    
      subject.insert(subject.root, 2)
      subject.insert(subject.root, 4)
    end

    it { expect(subject.search(subject.root, 2)).to eq true }
    it { expect(subject.search(subject.root, 5)).to eq false }
  end
 
end
