class Rot13
  attr_accessor :str, :alphabet

  ALPHABET = 'abcdefghijklmnopqrstuvwxyz'.freeze

  def initialize(str)
    raise 'invalid_argument' if str.nil?
    @lowercase_alphabet = ALPHABET.split('')
    @uppercase_alphabet = ALPHABET.upcase.split('')
    @str = str.split('')
  end

  def encode
    res = ''
    for i in 0..@str.length - 1
      res << ' ' and next if @str[i] == ' '
      alphabet = (/[[:upper:]]/.match(@str[i]).nil?) ? @lowercase_alphabet : @uppercase_alphabet
      res << alphabet[(alphabet.index(@str[i]) + 13)%26]
    end
    res
  end
end

describe Rot13 do
  subject { described_class.new(str) }

  let(:str) { "abcde" }

  it { expect(subject.str).to contain_exactly('a', 'b', 'c', 'd', 'e') }
  it { expect(subject.str[2]).to eq 'c' }

  describe '#encode' do
    it { expect(subject.encode).to eq("nopqr") }

    context 'when text is vwxyz' do
      let(:str) { "vwxyz" }

      it { expect(subject.encode).to eq("ijklm") }
    end

    context 'when text is vwxyz' do
      let(:str) { "world" }

      it { expect(subject.encode).to eq("jbeyq") }
    end

    context 'when text is uppercase' do
      let(:str) { "Sergio" }

      it { expect(subject.encode).to eq("Fretvb") }
    end

    context 'when text contains space' do
      let(:str) { "Hello Sergio" }

      it { expect(subject.encode).to eq("Uryyb Fretvb") }
    end

    context 'when text is nil' do
      let(:str) { nil }

      it { expect { subject.encode }.to raise_error('invalid_argument') }
    end

    context 'when text is empty' do
      let(:str) { "" }

      it { expect(subject.encode).to eq("") }
    end
  end
end
