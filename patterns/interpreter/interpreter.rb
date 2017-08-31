class Word
  def initialize(value)
    @value = value
  end

  def execute
    @value
  end
end

class Plus
  def initialize(first, second)
    @first = first
    @second = second
  end

  def execute
    @first.execute + @second.execute
  end
end


class Minus
  def initialize(first, second)
    @first = first
    @second = second
  end

  def execute
    @left.execute - @right.execute
  end
end

class Interpreter
  def parse(input)
    stack = []
    input.lstrip!

    while input.length > 0
      case input
      when /\A-?\d+(\.\d+)?/ #first char is a number
        stack << Word.new($&.to_i)
      else
        second, first = stack.pop(), stack.pop()
        case input
          when /\A\+/
            stack << Plus.new(first, second)
          when /\A\-/
            stack << Minus.new(first, second)
        else
          raise 'token unknown'
        end
      end
      input = $'
      input.lstrip!
    end

    raise 'Syntax error' unless stack.size == 1
    stack.first.execute
  end
end
