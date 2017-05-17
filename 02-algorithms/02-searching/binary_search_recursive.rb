require 'benchmark'

def binary_search(collection, first_index, last_index, value)
  low = first_index
  high = last_index
  if low > high
    return nil
  end
  mid = (low + high) / 2
  if collection[mid] > value
    binary_search(collection, low, mid - 1, value)
  elsif collection[mid] < value
    binary_search(collection, mid + 1, high, value)
  else
    return mid
  end
end


collection = [1, 2, 3, 4, 5, 6]

puts Benchmark.measure { binary_search(collection, 0, collection.size - 1, 2) }

puts "1: #{binary_search(collection, 0, collection.size - 1, 1)}"
puts "2: #{binary_search(collection, 0, collection.size - 1, 2)}"
puts "3: #{binary_search(collection, 0, collection.size - 1, 3)}"
puts "4: #{binary_search(collection, 0, collection.size - 1, 4)}"
puts "5: #{binary_search(collection, 0, collection.size - 1, 5)}"
puts "6: #{binary_search(collection, 0, collection.size - 1, 6)}"
puts "7: #{binary_search(collection, 0, collection.size - 1, 7)}"
