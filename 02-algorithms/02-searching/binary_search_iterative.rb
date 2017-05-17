require 'benchmark'

def binary_search(collection, value)
  low = 0
  high = collection.size - 1
  while low <= high
    mid = (low + high) / 2
    if collection[mid] > value
      high = mid - 1
    elsif collection[mid] < value
      low = mid + 1
    else
      return mid
    end
  end
  return nil
end

collection = [1, 2, 3, 4, 5, 6]

puts Benchmark.measure { binary_search(collection, 2) }

puts binary_search(collection, 1)
puts binary_search(collection, 2)
puts binary_search(collection, 3)
puts binary_search(collection, 4)
puts binary_search(collection, 5)
puts binary_search(collection, 6)
puts binary_search(collection, 7)
