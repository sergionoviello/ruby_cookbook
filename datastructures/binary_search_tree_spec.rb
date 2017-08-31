require_relative 'binary_search_tree'

describe DataStructures::BinarySearchTree do
  subject { described_class.new(value) }

  let(:value) { 5 }

  it { expect(subject.root_node.value).to eq(5) }

  context 'when valid bst' do
    before do
      subject.insert(2)
      subject.insert(10)
    end

    it { expect(subject.valid_BST?(subject.root_node)).to be_truthy }
  end

  context 'when invalid bst' do
    let(:node1) { DataStructures::Node.new(10) }
    let(:node2) { DataStructures::Node.new(1) }
    before do
      subject.root_node.left = node1
      subject.root_node.right = node2
    end

    it { expect(subject.valid_BST?(subject.root_node)).to be_falsey }
  end

  describe '#search' do
    let(:node1) { DataStructures::Node.new(2) }
    let(:node2) { DataStructures::Node.new(10) }

    before do
      subject.insert(node1.value)
      subject.insert(node2.value)
    end

    it {  expect(subject.search(2, subject.root_node).value).to eq(node1.value) }

    context 'when it cannot be found' do
      let(:node1) { DataStructures::Node.new(3) }

      it {  expect(subject.search(2, subject.root_node)).to eq(nil) }
    end
  end

  describe '#delete' do
    let(:value) { 8 }

    before do
      subject.insert(4)
      subject.insert(2)
      subject.insert(5)
      subject.insert(9)
    end

    it 'removes' do
      subject.delete(4)
      expect(subject.root_node.left.value).to eq(5)
    end
  end

  describe '#find_min_node' do
    let(:value) { 8 }

    before do
      subject.insert(4)
      subject.insert(2)
      subject.insert(5)
      subject.insert(9)
    end

    it { expect(subject.find_min_node(subject.root_node).value).to eq(2) }
  end
end
