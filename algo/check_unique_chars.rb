require 'set'

def check_unique_chars(str)
  res = Hash.new(0)
  str.split('').each{|key| res[key] += 1}

  res.each { |k, v| return false if v > 1 }
  return true
end

puts check_unique_chars("abcd")


puts "abcda".split('').to_set.size == "abcda".length
puts "abcd".split('').to_set.size == "abcd".length
