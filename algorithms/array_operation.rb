require 'rspec/autorun'

class ArrayOperation
  attr_accessor :arr

  def initialize(arr)
    @arr = arr
  end

  def binary_search(value)
    min = 0
    max = @arr.length - 1

    while min <= max
      mid = min + (max - min) / 2

      if @arr[mid] == value
        return mid
      elsif @arr[mid] < value
        min = mid + 1
      else
        max = mid - 1
      end
    end
  end

  def bubble_sort
    n = @arr.length

    for i in 0..n
      for j in 0..n - i - 2
        if @arr[j] > @arr[j+1]
          temp = @arr[j]
          @arr[j] = @arr[j+1]
          @arr[j+1] = temp
        end
      end
    end
    @arr
  end

  def quicksort
    quick_sort(@arr)
  end

  def notinplacequicksort
    not_in_place_quick_sort(@arr)
  end

  def mergesort
    merge_sort(@arr)
  end

  private

  def merge_sort(arr)
    return arr if arr.size <= 1

    n = arr.size
    half = (n / 2).round
    left = arr.take(half)
    right = arr.drop(half)

    sorted_left = merge_sort(left)
    sorted_right = merge_sort(right)

    merge(sorted_left, sorted_right)
  end

  def merge(left, right)
    if right.empty?
      return left
    end

    if left.empty?
      return right
    end

    if left[0]  <= right[0]
      min = left.shift
    else
      min = right.shift
    end

    merged = merge(left, right)

    [min].concat(merged)

  end

  def not_in_place_quick_sort(arr)
    return arr if arr.length <= 1

    pivot_index = (arr.length / 2).to_i
    pivot_value = arr[pivot_index]

    arr.delete_at(pivot_index)

    left = Array.new
    right = Array.new

    arr.each do |x|
      if x <= pivot_value
        left << x
      else
        right << x
      end
    end

    return not_in_place_quick_sort(left) + [pivot_value] + not_in_place_quick_sort(right)

  end

  def quick_sort(arr)
    return [] if arr.empty?

    pivot = arr.delete_at(rand(arr.size))
    left, right = arr.partition(&pivot.method(:>))

    return *quick_sort(left), pivot, *quick_sort(right)
  end
end

describe ArrayOperation do
  subject { described_class.new(arr) }

  let(:arr) { [] }

  describe '#binary_search' do
    let(:arr) { [1, 3, 5, 2, 6, 8] }

    it { expect(subject.binary_search(3)).to eq(1) }
  end

  describe '#bubble_sort' do
    let(:arr) { [21, 15, 8] }

    it { expect(subject.bubble_sort).to eq([8, 15, 21]) }
  end

  describe '#quick_sort' do
    let(:arr) { [21, 15, 8, 4, 9] }

    it { expect(subject.quicksort).to eq([4, 8, 9, 15, 21]) }
  end

  describe '#not_in_place_quick_sort' do
    let(:arr) { [21, 15, 8, 4, 9] }

    it { expect(subject.notinplacequicksort).to eq([4, 8, 9, 15, 21]) }
  end

  describe '#mergesort' do
    let(:arr) { [21, 15, 8, 4, 9] }

    it { expect(subject.mergesort).to eq([4, 8, 9, 15, 21]) }
  end

end
