require_relative 'priority_queue'

describe DataStructures::PriorityQueue do
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
