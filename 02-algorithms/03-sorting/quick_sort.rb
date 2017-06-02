# Quick Sort
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

#selection = [9, 5, 3, 7, 2, 6, 1, 8, 4]
#print quick_sort(selection)

# Quick Sort In Place
def in_place_quick_sort(collection, left, right)
  if left < right
    pivot_index = right
    q = partition(collection, left, right, pivot_index)
    in_place_quick_sort(collection, left, q-1)
    in_place_quick_sort(collection, q+1, right)
  end
  return collection
end

def partition(collection, left, right, pivot_index)
  pivot = collection[pivot_index]
  collection[pivot_index], collection[right] = collection[right], collection[pivot_index]
  free = left
  (left..right-1).each do |i|
    if collection[i] < pivot
      collection[i], collection[free] = collection[free], collection[i]
      free += 1
    end
  end
  collection[free], collection[right] = collection[right], collection[free]
  return free
end

#selection = [9, 5, 3, 7, 2, 6, 1, 8, 4]
#print in_place_quick_sort(selection, 0, selection.size - 1)
