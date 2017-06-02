def insertion_sort(collection)
   sorted_collection = [collection.delete_at(0)]
   for val in collection
     sorted_collection_index = 0
     while sorted_collection_index < sorted_collection.length
       if val <= sorted_collection[sorted_collection_index]
         sorted_collection.insert(sorted_collection_index, val)
         break
       elsif sorted_collection_index == sorted_collection.length - 1
         sorted_collection.insert(sorted_collection_index + 1, val)
         break
       end
       sorted_collection_index += 1
     end
   end
   sorted_collection
 end

 #selection = [9, 5, 3, 7, 2, 6, 1, 8, 4]
 #print insertion_sort(selection)
