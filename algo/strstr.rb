class Strstr
  attr_accessor :haystack, :needle

  def initialize(haystack, needle)
    @haystack = haystack
    @needle = needle
  end

  def execute
    for i in 0..@haystack.length
      j = 0
      while j < @needle.length && i+j < @haystack.length
        break if @haystack[i+j] != @needle[j]

        if j == @needle.length - 1
          return i
        end
        j+=1
      end
    end
    -1
  end
end
