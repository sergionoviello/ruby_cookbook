class Palindrome

  def palindrome?(str)
    return true if str.length <= 1
    return false if str[0] != str[str.length - 1]

    palindrome?(str[1..str.length - 2])
  end
end


RSpec.describe Palindrome do
  subject { described_class.new }

  let(:str) { "abba" }

  describe '#initialize' do
    it { expect(subject).to be_a Palindrome }
  end

  describe '#palindrome?' do

    context 'when str is hello' do
      let(:str) { 'hello' }

      it { expect(subject.palindrome?(str)).to eq false }
    end

    context 'when str is abba' do
      let(:str) { 'abba' }

      it { expect(subject.palindrome?(str)).to eq true }
    end
  end
end
