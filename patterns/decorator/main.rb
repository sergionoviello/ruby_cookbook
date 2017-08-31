require_relative 'burger'
require_relative 'large_burger'

b = Burger.new
puts b.cost

puts

b2 = LargeBurger.new(b)
puts b2.cost
