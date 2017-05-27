require 'benchmark'

require_relative 'binary_tree/binary_search_tree'
require_relative 'min_binary_heap/min_binary_heap'

root1 = Node.new(1, 1)
root2 = Node.new(500, 500)

node_to_find = Node.new(1, 1)

tree = BinarySearchTree.new(root2)
heap = MinBinaryHeap.new(root1)

n = 1000
Benchmark.bm do |x|
  x.report { for i in 1..n; node = Node.new(i, i); tree.insert(root2, node); end }
  x.report { for i in 1..n; node = Node.new(i, i); heap.insert(root1, node); end }
  x.report { tree.find(root2, 300) }
  x.report { heap.find(root1, 300) }
  x.report { tree.delete(root2, 300) }
  x.report { heap.delete(root1, 300) }
end
