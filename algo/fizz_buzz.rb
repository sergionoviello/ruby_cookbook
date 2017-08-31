class FizzBuzz
  def initialize(n)
    @n = n
  end

  def execute
    res = ''
    for i in 1..@n
      res << "FizzBuzz" and next if i % 3 == 0 && i % 5 == 0
      res << "Fizz" and next if i % 3 == 0
      res << "Buzz" and next if i % 5 == 0
      res << i.to_s
    end
    res
  end
end
