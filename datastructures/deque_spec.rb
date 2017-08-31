require_relative 'deque'

describe DataStructures::Deque do
  subject { described_class.new }

  it { expect(subject.size).to eq(0) }

  describe '.enqueue' do
      before do
        subject.enqueue(5)
        subject.enqueue(3)
      end

      it { expect(subject.size).to eq(2) }
      it { expect(subject.top).to eq(5) }
  end

  describe '.dequeue' do
      before do
        subject.enqueue(5)
        subject.enqueue(3)
        subject.dequeue
      end

      it { expect(subject.size).to eq(1) }
      it { expect(subject.top).to eq(3) }
  end

  describe '.front_enqueue' do
      before do
        subject.enqueue(5)
        subject.enqueue(3)
        subject.dequeue
        subject.front_enqueue(10)
      end

      it { expect(subject.size).to eq(2) }
      it { expect(subject.top).to eq(10) }
  end

  describe '.back_enqueue' do
      before do
        subject.enqueue(5)
        subject.enqueue(3)
        subject.front_enqueue(10)
        subject.dequeue
        subject.back_dequeue(1)
      end

      it { expect(subject.size).to eq(1) }
      it { expect(subject.top).to eq(5) }
      it { expect(subject.bottom).to eq(5) }
  end


end
