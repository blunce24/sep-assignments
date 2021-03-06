# Improved the code with a different data structure (used heap sort)

class Array
  # Heap Sort of an Array
  def heap_sort
    self.heapify
    finish = self.length - 1
    while finish > 0
      self[finish], self[0] = self[0], self[finish]
      finish -= 1
      self.sift_down(0, finish)
    end
    self
  end

  def heapify
    start = get_parent(self.length - 1)
    while start >= 0
      self.sift_down(start, self.length - 1)
      start -= 1
    end
    self
  end

  def sift_down(start, finish)
    root = start
    while get_left_child(root) <= finish
      child = get_left_child(root)
      swap = root
      if self[swap] < self[child]
        swap = child
      end
      if child + 1 <= finish && self[swap] < self[child + 1]
        swap = child + 1
      end
      if swap == root
        return
      else
        self[root], self[swap] = self[swap], self[root]
        root = swap
      end
    end
  end

  private

  def get_parent(i)
    return (i - 1) / 2
  end

  def get_left_child(i)
    return i * 2 + 1
  end

end

def poorly_written_ruby(*arrays)
  combined_array = []
  arrays.each do |array|
    combined_array += array
  end

  sorted_array = combined_array.heap_sort

  # Return the sorted array
  sorted_array
end

array1 = [1, 4, 5, 6]
array2 = [5, 6, 2, 8]
array3 = [2, 5, 9, 6]

print poorly_written_ruby_three(array1, array2, array3)
