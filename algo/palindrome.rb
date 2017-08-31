

def palindrome?(str)
  str.downcase!
  return true if str.length <= 1

  if str[0] != str[str.length-1]
    return false
  else
    return palindrome?(str[1..str.length - 2])
  end
end


puts palindrome?("madam")
puts palindrome?("anna")
puts palindrome?("Pippo")
puts palindrome?("Madam")
