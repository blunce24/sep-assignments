require 'benchmark'

require_relative 'node'
require_relative 'linked_list'

array = Array.new(10000, 'x')

llist = LinkedList.new

node = Node.new("Rob")

node2 = Node.new("Blair")


for i in 0..5
  llist.add_to_tail(node)
end

llist.add_to_tail(node2)

for i in 0..5
  llist.add_to_tail(node)
end


puts Benchmark.measure { Array.new(10000, 'x') }
n = 10000
Benchmark.bm do |x|
  x.report { n.times do llist.add_to_tail(node); end}
end

puts array.fetch(5000)
puts Benchmark.measure { array.fetch(5000) }
#puts llist.find(node2)
#puts Benchmark.measure { llist[5000] }

puts Benchmark.measure { array.delete_at(5000) }
puts Benchmark.measure { llist.delete(node2) }
