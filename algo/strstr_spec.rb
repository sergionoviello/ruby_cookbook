require_relative 'strstr'

describe Strstr do
  subject { described_class.new(haystack, needle) }

  describe '#initialize' do
    let(:haystack) { "TutorialsPoint" }
    let(:needle) { "Point" }

    it { expect(subject.execute).to eq(9) }

    context 'when does not find' do
      let(:needle) { "abc" }

      it { expect(subject.execute).to eq(-1) }
    end
  end
end
