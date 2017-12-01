#If a=1, b=2, c=3,....z=26. Given a string, find all possible codes that string can generate. Give a count as well as print the strings.

# For example:
# Input: "1123". You need to general all valid alphabet codes from this string.

# Output List
# aabc //a = 1, a = 1, b = 2, c = 3
# kbc // since k is 11, b = 2, c= 3
# alc // a = 1, l = 12, c = 3
# aaw // a= 1, a =1, w= 23
# kw // k = 11, w = 23

# https://discuss.leetcode.com/topic/69871/generate-all-possible-letter-combinations-from-numbers/2

def slice_array(input, s, list)
  if input.nil? || input.empty?
    list << s
    return
  end

  for i in 1..2
    sub = input[0..(i - 1)]

    unless sub.to_i > 26
      slice_array(input[i..input.length], s + (sub.to_i + 96).chr, list)
    end
  end
  list.uniq
end

a = [1, 1, 2, 3]
res = slice_array('1123', '', [])
p res