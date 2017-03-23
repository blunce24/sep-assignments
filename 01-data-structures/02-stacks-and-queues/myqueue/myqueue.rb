class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[0]
  end

  def enqueue(element)
    if @head == nil
      @queue.insert(0, element)
      @head = @queue[0]
      @tail = @queue[0]
    else
      @queue.insert(@queue.length, element)
      @head = @queue[-1]
      @tail = @queue[0]
    end
  end

  def dequeue
    value = @tail
    @tail = @queue[1]
    @queue.delete(value)
    @head = @queue[-1]
    value
  end

  def empty?
    @head.nil? && @tail.nil?
  end
end
