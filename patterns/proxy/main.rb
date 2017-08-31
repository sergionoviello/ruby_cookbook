require_relative 'bank'
require_relative 'account_proxy'


bank = Bank.new(10)
bank.deposit(5)
puts bank.balance


proxy = AccountProxy.new(bank, 'owner')
proxy.deposit(10)
puts proxy.balance
