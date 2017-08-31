require_relative 'plain_formatter'
require_relative 'html_formatter'
require_relative 'report'

report = Report.new(PlainFormatter.new)
report.output_report

report.formatter = HtmlFormatter.new
report.output_report
