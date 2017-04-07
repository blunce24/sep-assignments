def fib(n)
  if n < 2
    num = n
  end
  first = 0
  second = 1
  for i in 0...(n - 1)
    num = first + second
    first = second
    second = num
  end
  num
end


puts fib(0)
puts fib(1)
puts fib(2)
puts fib(3)
puts fib(4)
puts fib(5)
puts fib(6)
puts fib(7)
puts fib(8)
puts fib(9)
