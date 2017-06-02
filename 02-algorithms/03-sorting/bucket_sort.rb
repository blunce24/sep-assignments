require_relative 'insertion_sort'

def bucket_sort(collection, bucket_size = 5)
  min = collection.min
  max = collection.max
  bucket_count = ((max - min) / bucket_size).floor + 1
  buckets = Array.new(bucket_count)

  (0..buckets.length - 1).each do |i|
    buckets[i] = []
  end

  (0..collection.length - 1).each do |j|
    place = ((collection[j] - min) / bucket_size).floor
    buckets[place].push(collection[j])
  end

  collection.clear
  (0..buckets.length - 1).each do |i|
    buckets[i] = insertion_sort(buckets[i])
    buckets[i].each do |val|
      collection.push(val)
    end
  end
  return collection
end

#selection = [9, 5, 3, 7, 2, 6, 1, 8, 4]
#puts bucket_sort(selection)
