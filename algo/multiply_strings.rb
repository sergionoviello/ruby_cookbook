class MultiplyStrings
  attr_accessor :s1, :s2
  def initialize(s1, s2)
    @s1 = s1
    @s2 = s2
  end

  def multiply
    n1 = @s1.size
    n2 = @s2.size

    if n1 == 0 || n2 == 0
      return "0"
    end

    result = Array.new(n1+n2) { 0 }
    i1 = 0
    i2 = 0


    (n1-1).downto(0) do |i|
      carry = 0
      nn1 = @s1[i].to_i

      i2 = 0
      (n2-1).downto(0) do |j|
        nn2 = @s2[j].to_i


        sum = nn2 * nn1 + result[i1 + i2] + carry

        puts
        carry = sum / 10

        result[i1 + i2] = sum % 10
        i2 += 1
      end
      if carry > 0
        result[i1 + i2] += carry
      end
      i1 += 1
    end

    i = result.size - 1
    while i >= 0 && result[i] == 0
      i-= 1
    end
    if i == -1
      return "0"
    end

    s = ""
    while i >= 0
      s += result[i].to_s
      i -= 1
    end
    s
  end
end


m = MultiplyStrings.new("215", "10")
print m.multiply
