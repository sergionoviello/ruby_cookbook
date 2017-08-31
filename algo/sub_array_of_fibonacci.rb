class LcsFibonacci
  def initialize(a, fib)
    res = []
    a.each do |i|
      res << i if fib.include?(i)
    end

    p res
  end
end

lcs = LcsFibonacci.new([1, 4, 3, 9, 10, 13, 7], [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144])
lcs = LcsFibonacci.new([0, 2, 8, 5, 2, 1, 4, 13, 23], [0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144])
