require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @linked_list = Array.new
    @head = @linked_list[0]
    @tail = @linked_list[0]
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head.nil?
      @linked_list.insert(0, node)
      @head = node
      @tail = @head
    else
      @linked_list.insert(@linked_list.length, node)
      @tail.next = node
      @tail = @tail.next
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    if @head == @tail
      remove_front
    end

    temp = @head

    if temp.nil?
      return
    end

    until temp.next == @tail
      temp = temp.next
    end

    @tail = temp
    @tail.next = nil
  end

  # This method prints out a representation of the list.
  def print
    current_node = @head
    list_str = ""
    while current_node != nil
      list_str += "#{current_node.data}\n"
      current_node = current_node.next
    end
    puts list_str
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if node == @tail
      remove_tail
    elsif node == @head
      remove_front
    else
      current_node = @head
      until current_node.next == node
        current_node = current_node.next
      end
      current_node.next = node.next
      node.next = nil
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    @linked_list.insert(0, node)
    if @head.nil?
      @head = node
      @tail = @head
    else
      node.next = @head
      @head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    temp = @head
    @head = temp.next
    temp.next = nil

    if @head.nil?
      @tail = nil
    end
  end

  def find(node)
    if node == @tail
      @tail
    elsif node == @head
      @head
    else
      current_node = @head
      until current_node.next == node
        current_node = current_node.next
      end
      current_node
    end
  end

end
