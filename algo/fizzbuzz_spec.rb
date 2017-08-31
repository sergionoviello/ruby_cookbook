require_relative 'fizz_buzz'

describe FizzBuzz do

  subject { described_class.new(n) }
  describe '#execute' do
    let(:n) {16}

    it { expect(subject.execute).to eq("12Fizz4BuzzFizz78FizzBuzz11Fizz1314FizzBuzz16") }
  end
end
