require 'rspec/autorun'
require_relative 'queue'

class PriorityQueue < Queue
  PQNode = Struct.new(:value, :priority)

  def enqueue(item, priority=0)
    raise RangeError.new("priority greater than size") if priority > self.size
    @array.push(PQNode.new(item, priority))
    @array.sort! { |a, b| a.priority <=> b.priority }
  end

  def dequeue
    r = method(:dequeue).super_method.call
    r.nil? ? r : r.value
  end

  def top
    method(:top).super_method.call.value
  end

  def bottom
    method(:top).super_method.call.value
  end
end

describe PriorityQueue do
  subject { described_class.new }

  it { expect(subject.size).to eq(0) }

  describe '.enqueue' do
      before do
        subject.enqueue(5, 0)
        subject.enqueue(3, -1)
      end

      it { expect(subject.size).to eq(2) }
      it { expect(subject.top).to eq(3) }
  end

  describe '.dequeue' do
    before do
      subject.enqueue(5, 0)
      subject.enqueue(3, -1)
      subject.enqueue(4, -2)
      subject.dequeue
    end

    it { expect(subject.size).to eq(2) }
    it { expect(subject.top).to eq(3) }
  end
end
