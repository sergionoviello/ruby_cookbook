class Report
  attr_reader :title
  attr_accessor :formatter

  def initialize(formatter)
    @title = 'report'
    @formatter = formatter
  end

  def output_report
    @formatter.output_report(self)
  end
end
