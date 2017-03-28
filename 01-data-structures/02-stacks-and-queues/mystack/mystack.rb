class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack.insert(0, item)
    self.top = item
  end

  def pop
    self.top = @stack[1]
    value = @stack[0]
    @stack.delete(value)
    value
  end

  def empty?
    self.top.nil?
  end
end
