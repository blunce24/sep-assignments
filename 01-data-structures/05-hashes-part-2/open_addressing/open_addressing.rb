require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
    @item_count = 0
  end

  def []=(key, value)
    i = index(key, @items.size)
    n = Node.new(key, value)
    if @items[i] == n
      return
    elsif @items[i] == nil
      @items[i] = n
    else
      new_i = next_open_index(i)
      if new_i == -1
        resize
      else
        @items[new_i] = n
      end
    end
    @item_count = @item_count + 1
  end

  def [](key)
    i = index(key, size)
    #node = @items[i]
    if @items[i].key == key
      @items[i].value
    else
      original = i
      while @items[i % size].key != key
        i += 1
        if i % size == original
          return -1
        end
      end
      @items[i % size].value
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    original = index
    while @items[index % size] != nil
      index += 1
      if index % size == original
        return -1
      end
    end
    return index % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  # Resize the hash
  def resize
    new_size = size*2
    new_items = Array.new(new_size)
    (0..@items.size-1).each do |i|
      node = @items[i]
      if node != nil
        new_index = index(node.key, new_items.size)
        if new_items[new_index] == nil
          new_items[new_index] = node
        else
          new_i = next_open_index(new_index)
          if new_i == -1
            resize
          else
            new_items[new_i] = node
          end
        end
      end
    end

    @items = new_items
  end

  def load_factor
    @item_count / self.size.to_f
  end

  def print
    puts "Hash Table Detail"
    puts "Load Factor: #{load_factor}"
    (0..@items.size-1).each do |i|
      puts "Hash Code: #{i}"
      if @items[i] != nil
        puts "Key: #{@items[i].key}"
        puts "Value: #{@items[i].value}"
      else
        puts "#{@items[i]}"
      end
    end
  end
end
