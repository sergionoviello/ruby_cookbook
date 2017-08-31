class Template
  def apply
    first
    second
    third
  end

  def first
    raise NotImplementedError
  end

  def second
    raise NotImplementedError
  end

  def third
    raise NotImplementedError
  end
end


class Shampoo < Template
  def first
    puts 'Shampoo 1'
  end

  def second
    puts 'Shampoo 2'
  end

  def third
    puts 'Shampoo 3'
  end
end


class Conditioner < Template
  def first
    puts 'conditioner 1'
  end

  def second
    puts 'conditioner 2'
  end

  def third
    puts 'conditioner 3'
  end
end

Shampoo.new.apply
Conditioner.new.apply
