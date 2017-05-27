require_relative 'node'

class MinBinaryHeap

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    current_node = root
    parent_node = insert_heap(current_node, node)
    while parent_node.rating > node.rating
      node = swap(parent_node, node)
      parent_node = node.parent
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    current_node = root
    if data == nil
      return nil
    end
    if current_node.title == data
      return current_node
    end
    left = find(current_node.left, data) if current_node.left
    right = find(current_node.right, data) if current_node.right
    left or right
  end

  def delete(root, data)
    if data == nil
      return nil
    end
    current_node = root
    node_delete = find(current_node, data)
    node_previous = node_delete.parent
    if node_previous.left == node_delete
      node_previous.left = nil
    elsif node_previous.right == node_delete
      node_previous.right = nil
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    queue = []
    queue.push(@root)
    while queue.size != 0
      n = queue.shift
      puts "#{n.title}: #{n.rating}"
      n.children.each do |child|
        queue.push(child)
      end
    end
  end

  private

  # Find the end of the heap to insert
  def insert_heap(current_node, new_node)
    # puts current_node.title
    if current_node.left == nil
      current_node.left = new_node
      new_node.parent = current_node
      return current_node
    elsif current_node.right == nil
      current_node.right = new_node
      new_node.parent = current_node
      return current_node
    else
      queue = []
      queue.push(current_node)
      while queue.size != 0
        n = queue.shift
        if n.left.left == nil || n.left.right == nil
          return insert_heap(n.left, new_node)
        elsif n.right.left == nil || n.right.right == nil
          return insert_heap(n.right, new_node)
        else
          n.children.each do |child|
            queue.push(child)
          end
        end
      end
    end
  end

  # Swap out a parent_node and new_node
  def swap(parent_node, new_node)
    # Put new_node's left and right nodes into temp variables
    temp_l = new_node.left
    temp_r = new_node.right
    # If the new_node is on the left, switch it with the parent_node
    if parent_node.left == new_node
        new_node.left = parent_node
        if parent_node.right
          new_node.right = parent_node.right
          new_node.right.parent = new_node
        end
    # If the new_node is on the right, shift the left node to the right, and the parent_node becomes the left node
    else
        new_node.left = parent_node
        new_node.right = parent_node.left
        parent_node.left.parent = new_node
    end
    # Reassign the parents for new_node and parent_node, and the right and left nodes for parent_node
    new_node.parent = parent_node.parent
    if new_node.parent.left == parent_node
      new_node.parent.left = new_node
    else
      new_node.parent.right = new_node
    end
    parent_node.parent = new_node
    parent_node.left = temp_l
    parent_node.right = temp_r
    return new_node
  end
end
