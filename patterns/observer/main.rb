require_relative 'employee'
require_relative 'tax_man'

fred = Employee.new('fred', 30_000)
tax_man = TaxMan.new

fred.add_observer(tax_man)

fred.salary = 40_000
