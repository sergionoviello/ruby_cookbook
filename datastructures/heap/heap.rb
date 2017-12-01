# a heap is a complete tree with nodes in all levels 
# except the last level. 
# It can be max or min heap . in max heap the root is the max of all children nodes
# and this applies to all parents.
# a heap is used for priority queues and heapsort



require 'rspec/autorun'

class MaxHeap
  attr_accessor :arr, :size

  def initialize(arr)
    @arr = arr
    @size = arr.size
    build_heap
  end

  def build_heap

    (0..@size/2-1).to_a.reverse.each do |i|
      heapify(i)
    end
  end

  def left_index(i)
    (2 * i) + 1
  end

  def right_index(i)
    (2 * i) + 2
  end

  def heapify(i)
    
    l = left_index(i)
    r = right_index(i)
    largest = i

    if l < @size && @arr[l] > @arr[i] 
      largest = l
    end

    if r < @size && @arr[r] >@arr[largest]
      largest = r
    end

    if largest != i
      @arr[largest], @arr[i] = @arr[i], @arr[largest]
      heapify(largest)
    end

  end
end


describe MaxHeap do
  subject { described_class.new(arr) }

  let(:arr) { [5, 9, 8, 6, 3, 1] }

  before do    

  end

  it { expect(subject.arr[0]).to eq 9 }
  
end

