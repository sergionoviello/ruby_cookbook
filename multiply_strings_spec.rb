require_relative 'multiply_strings'

describe MultiplyStrings do
  subject { described_class.new(s1, s2) }
  let(:s1) { "15" }
  let(:s2) { "10" }

  describe '#multiply' do
    context 'when strings are blank' do
      let(:s1) { "" }

      it { expect(subject.multiply).to eq "" }
    end

    it { expect(subject.multiply).to eq [0, 5, 0, 1, 1, 5, 1, 1] }

  end
end
