require_relative 'interpreter'

interp = Interpreter.new
res = interp.parse('4 3 +')
puts res
