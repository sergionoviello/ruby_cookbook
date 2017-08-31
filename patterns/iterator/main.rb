require_relative 'iterator'


it = Iterator.new(%w(red blue green))
while it.has_next?
  puts "#{it.next_item}"
end
