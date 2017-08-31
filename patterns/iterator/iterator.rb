class Iterator
  def initialize(array)
    @array = array.clone
    @index = 0
  end

  def has_next?
    @index < @array.length
  end

  def next_item
    value = @array[@index]
    @index += 1
    value
  end
end
