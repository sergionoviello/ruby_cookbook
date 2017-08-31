require_relative "reverse_words"

describe ReverseWords do
  subject { described_class.new(str) }

  let(:str) { 'the sky is blue' }

  describe '#initialize' do
    it { expect(subject.str).to eq('the sky is blue') }
  end

  describe '#reverse_words' do
    let(:str) { "I am sergio" }

    it { expect(subject.reverse_words).to eq("sergio am I") }
  end
end
