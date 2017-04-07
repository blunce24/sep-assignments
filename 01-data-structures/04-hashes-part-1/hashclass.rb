class HashClass

  def initialize(size)
    @items = Array.new(size)
    @size = size
    @keys = Array.new(size)
  end

  def []=(key, value)
    i = index(key, @size)
    if @items[i] == value
      return
    elsif @items[i] == nil
      @items[i] = value
      @keys[i] = key
    else
      until @items[i] == nil
        resize
      end
      @items[i] = value
      @keys[i] = key
    end
  end


  def [](key)
    i = index(key, @size)
    @items[i]
  end

  def resize
    @size *= 2
    arrI = Array.new(@size)
    arrK = Array.new(@size)
    for i in 0..@items.length
      key = @keys[i]
      value = @items[i]
      if key != nil
        j = index(key, @size)
        if arrI[j] == nil
          arrI[j] = value
          arrK[j] = key
        else
          resize
        end
      end
    end
    @items = arrI
    @keys = arrK
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  def print
    for i in 0..@items.length
      if @keys[i] != nil
        puts "#{i}: #{@keys[i]} = #{@items[i]}"
      end
    end
  end
end
