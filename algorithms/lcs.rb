class Lcs
  def initialize(a, b)
    @a = a
    @b = b
    @m = Array.new(a.length) { Array.new(b.length) }
    a.each_char.with_index do |x, i|
      b.each_char.with_index do |y, j|
        match(x, y, i, j)
      end
    end
  end

  def match(x, y, i, j)
    if x == y
      @m[i][j] = @m[i-1][j-1].nil? ? 1 : @m[i-1][j-1] + 1
    else
      left = @m[i-1][j].nil? ? 0 : @m[i-1][j]
      top = @m[i][j-1].nil? ? 0 : @m[i][j-1]
      @m[i][j] = [left, top].max
    end
  end

  def find_lcs
    res = []
    @c = @m.length - 1
    @r = @m[0].length - 1

    while @c >=0 && @r >=0
      res << compare(@m[@c][@r], @c, @r)
    end
    res << @m[0][0]
    p res.reverse.compact
  end

  def compare(val, c, r)
    found = nil
    if @m[c-1][r] == val
      @c = c-1
      @r = r
    elsif @m[c][r-1] == val
      @c = c
      @r = r - 1
    else
      found = @a[val]
      @c = c - 1
      @r = r - 1
    end
    found
  end
end


#lcs = Lcs.new("1234", "1224533324")
#lcs.find_lcs

lcs = Lcs.new('thisisatest', 'testing123testing')
lcs.find_lcs
