
require 'rspec/autorun'

class Node
  include Comparable
  attr_accessor :value, :priority

  def initialize(val, priority)
    @value = val
    @priority = priority
  end

  def <=> (other)
    @priority <=> other.priority
  end
end


class PQueue
  attr_accessor :arr

  def initialize
    @arr = [Node.new('', nil)]
  end

  def enqueue(node)
    @arr << node
    bubble_up(@arr.size - 1)
  end

  def bubble_up(i)
    parent = i / 2

    return if i <= 1 || @arr[parent] >=@arr[i]

    @arr[i], @arr[parent] = @arr[parent], @arr[i]
    bubble_up(parent)
  end

  def dequeue
    @arr[1], @arr[@arr.size - 1] = @arr[@arr.size - 1], @arr[1]
    
    max = @arr.pop
    bubble_down(1)
    max
  end

  def bubble_down(i)
    l = 2 * i
    r = 2 * i + 1
    largest = i

    if l < @arr.size - 1 && @arr[l] > @arr[i] 
      largest = l
    end

    if r < @arr.size - 1 && @arr[r] >@arr[largest]
      largest = r
    end

    if largest != i
      @arr[largest], @arr[i] = @arr[i], @arr[largest]
      bubble_down(largest)
    end
  end

end



describe PQueue do
  subject { described_class.new }

  before do   
    subject.enqueue Node.new('a', 2)
    subject.enqueue Node.new('b', 7)
    subject.enqueue Node.new('c', 1)
    subject.enqueue Node.new('d', 25)
    subject.enqueue Node.new('e', 3)
    subject.enqueue Node.new('f', 100)
    subject.enqueue Node.new('g', 19)
    subject.enqueue Node.new('h', 36)
  end

  it { expect(subject.dequeue.priority).to eq 100 }
  
  context 'when an element is pop' do
    before do
      subject.dequeue.priority
    end
    
    it { expect(subject.dequeue.priority).to eq 36 }
  end

  context 'when 2 elements is pop' do
    before do
      subject.dequeue.priority
      subject.dequeue.priority
    end
    
    it { expect(subject.dequeue.priority).to eq 25 }
  end
end

