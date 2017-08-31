class Lcs
  def initialize(a, b)
    @x = a
    @y = b
    @m = Array.new(a.length + 1) { Array.new(b.length + 1) }

    for i in 0..a.length + 1
      @m[i][0] = 0
    end
    for i in 0..a.length + 1
      @m[0][i] = 0
    end

    for r in 1..a.length
      for c in 1..b.length
        #p r, c
        if @x[r-1] == @y[c-1]
          @m[r][c] = @m[r-1][c-1].nil? ? 1 : @m[r-1][c-1] + 1
        else
          left = @m[r-1][c].nil? ? 0 : @m[r-1][c]
          top = @m[r][c-1].nil? ? 0 : @m[r][c-1]

          @m[r][c] = [left, top].max
        end
      end
    end
  end

  def find_lcs
    r = @x.length
    c = @y.length
    i = @m[r][c]
    lcs = Array.new(i)
    while r > 0 && c > 0
      if @x[r-1] == @y[c-1]
        lcs[i - 1] = @x[r - 1]
        i = i - 1
        r = r - 1
        c = c - 1
      elsif @m[r-1][c] > @m[r][c-1]
        r = r - 1
      else
        c = c - 1
      end
    end
    lcs
  end

  def compare(val, c, r)
    found = false
    if @m[c-1][r] == val
      @c -= 1
    elsif @m[c][r-1] == val
      @r -= 1
    else
      found = true
      @c -= 1
      @r -= 1
    end
    found
  end
end

# lcs = Lcs.new("acbcf", "abcdaf")
# p lcs.find_lcs
#
# lcs = Lcs.new('thisisatest', 'testing123testing')
# p lcs.find_lcs
