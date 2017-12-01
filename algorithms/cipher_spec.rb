require_relative 'cipher'

RSpec.shared_examples "encrypted string" do |encrypted|
  it { expect(subject.encrypt).to eq encrypted }
end

RSpec.describe Cipher do
  subject { described_class.new(str) }
  let(:str) { 'abc' }

  it { expect(subject).to be_a Cipher }

  describe '#initialize' do
    it { expect(subject.str).to eq ['a', 'b', 'c'] }
    it { expect(subject.lowercase_alphabet.count).to eq 26 }
    it { expect(subject.uppercase_alphabet[0]).to eq 'A' }
    it { expect(subject.uppercase_alphabet[25]).to eq 'Z' }
  end

  describe '#encrypt' do
    let(:str) { 'abcd' }

    it_behaves_like 'encrypted string', 'nopq'

    context 'when str is wxyz' do
      let(:str) { 'wxyz' }

      it_behaves_like 'encrypted string', 'jklm'
    end

    context 'when str is world' do
      let(:str) { 'world' }

      it_behaves_like 'encrypted string', 'jbeyq'
    end

    context 'when str is World' do
      let(:str) { 'WorlD' }

      it_behaves_like 'encrypted string', 'JbeyQ'
    end

    context 'when str is random' do
      let(:str) { 'a ljd qklh qier alsAVBmc lsdkfj ih' }

      it_behaves_like 'encrypted string', 'n ywq dxyu dvre nyfNIOzp yfqxsw vu'
    end
  end
end
