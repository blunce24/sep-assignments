# Improved the code with a more efficient algorithm

def quick_sort(collection)
  return collection if collection.size <= 1
  pivot = collection[-1]
  collection.delete_at(-1)
  lesser = []
  greater = []
  for val in collection
    if val <= pivot
      lesser.push(val)
    else
      greater.push(val)
    end
  end
  return quick_sort(lesser) + [pivot] + quick_sort(greater)
end

def poorly_written_ruby_two(*arrays)
  combined_array = []
  arrays.each do |array|
    combined_array += array
  end

  sorted_array = quick_sort(combined_array)

  # Return the sorted array
  sorted_array
end

array1 = [1, 4, 5, 6]
array2 = [5, 6, 2, 8]
array3 = [2, 5, 9, 6]

print poorly_written_ruby_two(array1, array2, array3)
