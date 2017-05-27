require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    current_node = root
    if node.rating <= current_node.rating
      current_node.left.nil? ? current_node.left = node : insert(current_node.left, node)
    elsif node.rating > current_node.rating
      current_node.right.nil? ? current_node.right = node : insert(current_node.right, node)
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
    node_previous = transverse(current_node, node_delete)
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

  def transverse(current_node, target_node)
    if current_node.left == target_node
      return current_node
    elsif current_node.right == target_node
      return current_node
    end
    if target_node.rating <= current_node.rating
      transverse(current_node.left, target_node)
    elsif target_node.rating > current_node.rating
      transverse(current_node.right, target_node)
    end
  end
end
