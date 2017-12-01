class FizzBuzz
  def initialize(n)
    @n = n
  end

  def execute
    res = ''
    for i in 1..@n
      res << "FizzBuzz" and next if i % 3 == 0 && i % 5 == 0
      res << "Fizz" and next if i % 3 == 0
      res << "Buzz" and next if i % 5 == 0
      res << i.to_s
    end
    res
  end
end

describe FizzBuzz do

  subject { described_class.new(n) }
  describe '#execute' do
    let(:n) {16}

    it { expect(subject.execute).to eq("12Fizz4BuzzFizz78FizzBuzz11Fizz1314FizzBuzz16") }
  end
end
