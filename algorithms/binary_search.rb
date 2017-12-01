

def binary_search(value, arr)
  min = 0
  max = arr.length - 1
  while min <= max do
    med = min + (max - min)/2

    if arr[med] == value
      return med
    elsif arr[med] < value
      min = med + 1
    else arr[med] > value
      max = med - 1
    end
  end
end


def bubble_sort(arr)
  n = arr.length
  for i in 0..n-1
    for j in 0..n - i - 2
      if arr[j] > arr[j+1]
        temp = arr[j]
        arr[j] = arr[j+1]
        arr[j+1] = temp
      end
    end
  end
  arr
end


#arr = [1, 2, 3, 4, 5, 6, 7, 8]
arr = [0, 14, 9, 4, 5, 1, 3]
puts bubble_sort(arr)
