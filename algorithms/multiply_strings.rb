class MultiplyStrings
  attr_accessor :s1, :s2

  def initialize(s1, s2)
    @s1 = s1
    @s2 = s2
  end

  def multiply
    len1 = s1.size
    len2 = s2.size

    if len1 == 0 || len2 == 0
      return ""
    end

    res = []
    i1 = 0
    (len1 - 1).downto(0).each do |i|

      i2 = 0
      (len2 - 1).downto(0).each do |j|
        digit1 = @s1[i1].to_i
        digit2 = @s2[i2].to_i

        res << digit2
        #res << digit1

        i2 += 1
      end
      i1+=1
    end

    res
  end
end


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
