class Strstr
  attr_accessor :haystack, :needle

  def initialize(haystack, needle)
    @haystack = haystack
    @needle = needle
  end

  def execute
    for i in 0..@haystack.length
      j = 0
      while j < @needle.length && i+j < @haystack.length
        break if @haystack[i+j] != @needle[j]

        if j == @needle.length - 1
          return i
        end
        j+=1
      end
    end
    -1
  end
end

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
