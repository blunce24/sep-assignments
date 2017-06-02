require 'benchmark'

require_relative 'insertion_sort'
require_relative 'selection_sort'
require_relative 'bubble_sort'
require_relative 'merge_sort'
require_relative 'quick_sort'
require_relative 'heap_sort'
require_relative 'bucket_sort'

#(0..5000).to_a.sort{ rand() - 0.5 } = (0..50).to_a.sort{ rand() - 0.5 }
# sequence = (0..5000).to_a.sort{ rand() - 0.5 }
# bubble_sort(sequence)
# print sequence

Benchmark.bm do |x|
  x.report("insertion sort:") { insertion_sort((0..500).to_a.sort{ rand() - 0.5 }) }
  x.report("selection sort:") { selection_sort((0..500).to_a.sort{ rand() - 0.5 }) }
  x.report("bubble sort:") { bubble_sort((0..500).to_a.sort{ rand() - 0.5 }) }
  x.report("merge sort:") { merge_sort((0..500).to_a.sort{ rand() - 0.5 }) }
  x.report("quick sort:") { quick_sort((0..500).to_a.sort{ rand() - 0.5 }) }
  x.report("quick sort (in place):") { in_place_quick_sort((0..500).to_a.sort{ rand() - 0.5 }, 0, 500) }
  x.report("heap sort:") { (0..500).to_a.sort{ rand() - 0.5 }.heap_sort }
  x.report("bucket sort:") { bucket_sort((0..500).to_a.sort{ rand() - 0.5 }) }
end
