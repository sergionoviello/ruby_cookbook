
class ReverseWords
  attr_accessor :str

  def initialize(str)
    @str = str
  end

  def reverse_words
    str = @str
    len = str.length
    reverse_string(str, len)
    p = 0
    str.split('').each_with_index do |c, i|
      if c == ' '
        str[p..i-1] = reverse_string(str[p..i-1], i-p)
        p = i + 1
      end
    end
    str[p..len-1] = reverse_string(str[p..len-1], len-p)
    str
  end

  def reverse_string(str, len)
    i = 0
    for c in 0..len/2 - 1
      swap(str, i, len-i-1)
      i += 1
    end
    str
  end

  def swap(str, i, j)
    tmp = str[i]
    str[i] = str[j]
    str[j] = tmp
  end
end

#rv = ReverseWords.new "the sky is blue"
#puts rv.reverse_words
