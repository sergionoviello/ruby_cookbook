require_relative 'lcs'


str = "abcdecba"
rev = str.reverse
k = 1
lcs = Lcs.new(str, rev)
res = lcs.find_lcs
diff = str.split('') - res
p diff.length == k


str2 = "abcdeca"
rev2 = str2.reverse
k2 = 2
lcs2 = Lcs.new(str2, rev2)
res2 = lcs2.find_lcs
diff2 = str2.split('') - res2
p diff2.length == k2

str2 = "acdcb"
rev2 = str2.reverse
k2 = 1
lcs2 = Lcs.new(str2, rev2)
res2 = lcs2.find_lcs
diff2 = str2.split('') - res2
p diff2.length == k2
