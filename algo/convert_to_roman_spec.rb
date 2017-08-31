require_relative 'convert_to_roman'

describe ToRoman do
  subject { described_class.new(number) }

  let(:number) { 152 }

  it { expect(subject.to_roman).to eq('CLII') }
end
