require_relative 'sla_period'

describe SlaPeriod do
  subject { described_class.new(d1, d2) }

  describe '#initialize' do
    let(:d1) { "2017-06-07" }
    let(:d2) { "2017-06-20" }

    it { expect(subject.execute).to eq(true) }
  end
end
