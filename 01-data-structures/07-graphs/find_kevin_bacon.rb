def find_kevin_bacon(start_node)
  if start_node == Kevin_Bacon
    return start_node
  end
  films = []
  while films.size <= 6
    start_node.film_actor_hash.each do |film|
      if film_actor_hash[film].include? Kevin_Bacon
        films.push(film)
        return films
      else
        for i..film_actor_hash.size
          return find_kevin_bacon(film_actor_hash[film][i])
        end
      end
    end
    return films
  end
