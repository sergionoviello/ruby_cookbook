# calculate the dot product between 2 vectors
# we read the data from a file in this format
# 2 2
# 1 2
# 3 3
# 1 4
# 4 5

# the first line indicates how many values we have in each vector
# the following lines are the pos and the value of each element
# at the position not defined the value is 0. 
# the two vectors must have same size

# after reading the file, the vectors will look as follows:

# v1 = [0, 2, 0, 3, 0]
# v2 = [0, 4, 0, 0, 5]

# the dot product is : (0*0) + (2*4) + (0*0) + (3*0) + (0*5) = 8

# in this approach we use 2 loops with a complexity of O(n^2)


require 'rspec/autorun'

class DotProduct
  attr_accessor :file, :v1, :v2
  def initialize(file)
    @file = file
    @v1 = {}
    @v2 = {}
  end

  def build_vectors
    f = File.new(@file, 'r')

    first_line = f.gets
    match = /^(\d)\s(\d)$/.match(first_line)
    k = match[1].to_i

    cnt = 0
    while(line = f.gets)
      match = /^(\d)\s(\d)$/.match(line)
      pos = match[1].to_i
      val = match[2].to_i

      if cnt < k
        @v1[pos] = val
      else
        @v2[pos] = val
      end

      cnt += 1
    end
  end

  def calculate
    dot = 0
    
    for k1,v1 in @v1
      for k2, v2 in @v2
        dot += v1 * v2 if @v1.key?(k2) && @v2.key?(k1)
      end
    end
    dot
  end
end

describe DotProduct do
  let(:subject) { described_class.new(file) }
  let(:file) { 'dot_product/data.txt' }

  describe '#build_vectors' do
    before do
      subject.build_vectors
    end
    it { expect(subject.v1[1]).to eq 2 }
    it { expect(subject.v1[3]).to eq 3 }
    it { expect(subject.v2[1]).to eq 4 }
    it { expect(subject.v2[4]).to eq 5 }
    
  end

  describe '#calculate' do 
    before do
      subject.build_vectors
    end

    it { expect(subject.calculate).to eq 8 }

  end
end

