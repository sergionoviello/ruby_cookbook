class ToRoman
  def initialize(number)
    @number = number
    @map = roman_mapping
  end

  def to_roman
    res = ''
    roman_mapping.keys.each do |key|
      q, m = @number.divmod(key)
      res << roman_mapping[key] * q
      @number = m
    end
    res
  end

  private

  def roman_mapping
    {
      1000 => "M",
      900 => "CM",
      500 => "D",
      400 => "CD",
      100 => "C",
      90 => "XC",
      50 => "L",
      40 => "XL",
      10 => "X",
      9 => "IX",
      5 => "V",
      4 => "IV",
      1 => "I"
    }
  end
end
