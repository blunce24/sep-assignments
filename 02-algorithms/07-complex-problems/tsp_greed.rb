# Define city node
class City
  attr_accessor :name
  attr_accessor :neighbors
  attr_accessor :visited

  def initialize(name)
    @name = name
    @visited = false
  end

  def add_neighbors(neighbors)
    @neighbors = neighbors
  end
end

# Define nearest neighbor algorithm
def nearest_neighbor(graph_of_cities, current_city)
  while !current_city.visited
    neighbor_cities = current_city.neighbors
    next_city = neighbor_cities[0]
    for current_neighbor in neighbor_cities
      if current_neighbor[1] < next_city[1] && !current_neighbor[0].visited
        next_city = current_neighbor
      end
    end
    current_city.visited = true
    if !next_city[0].visited
      current_city = graph_of_cities[next_city[0].name]
    end
  end
  puts current_city.name
end

# Define 12 city nodes
denver = City.new("Denver")
minneapolis = City.new("Minneapolis")
kc = City.new("Kansas City")
stl = City.new("St. Louis")
okc = City.new("Oklahoma City")
el_paso = City.new("El Paso")
albequerque = City.new("Albequerque")
pheonix = City.new("Pheonix")
lv = City.new("Las Vegas")
slc = City.new("Salt Lake City")
boise = City.new("Boise")
sf = City.new("San Francisco")

# Define the neighbor arrays in each city node
denver.add_neighbors([[albequerque, 450], [kc, 602], [slc, 525], [minneapolis, 905]])
minneapolis.add_neighbors([[kc, 439], [denver, 905]])
kc.add_neighbors([[stl, 251], [denver, 602], [minneapolis, 439], [okc, 351]])
stl.add_neighbors([[kc, 251]])
okc.add_neighbors([[kc, 351], [el_paso, 693]])
el_paso.add_neighbors([[albequerque, 268], [okc, 693]])
albequerque.add_neighbors([[el_paso, 268], [denver, 450], [pheonix, 421]])
pheonix.add_neighbors([[lv, 297], [albequerque, 421]])
lv.add_neighbors([[pheonix, 297], [slc, 421]])
slc.add_neighbors([[boise, 345], [denver, 525], [lv, 421], [sf, 735]])
boise.add_neighbors([[slc, 345], [sf, 638]])
sf.add_neighbors([[boise, 638], [slc, 735]])

# Define hash for city graph with city nodes
graph_of_cities = Hash.new
graph_of_cities["Denver"] = denver
graph_of_cities["Minneapolis"] = minneapolis
graph_of_cities["Kansas City"] = kc
graph_of_cities["St. Louis"] = stl
graph_of_cities["Oklahoma City"] = okc
graph_of_cities["El Paso"] = el_paso
graph_of_cities["Albequerque"] = albequerque
graph_of_cities["Pheonix"] = pheonix
graph_of_cities["Las Vegas"] = lv
graph_of_cities["Salt Lake City"] = slc
graph_of_cities["Boise"] = boise
graph_of_cities["San Francisco"] = sf

#Test implementation

#nearest_neighbor(graph_of_cities, denver) #El Paso
#nearest_neighbor(graph_of_cities, minneapolis) #St. Louis
#nearest_neighbor(graph_of_cities, kc) #St.Louis
#nearest_neighbor(graph_of_cities, stl) #Kansas City
#nearest_neighbor(graph_of_cities, okc) #St. Louis
#nearest_neighbor(graph_of_cities, el_paso) #Albequerque
#nearest_neighbor(graph_of_cities, albequerque) #El Paso
#nearest_neighbor(graph_of_cities, pheonix) #Las Vegas
#nearest_neighbor(graph_of_cities, lv) #Pheonix
#nearest_neighbor(graph_of_cities, slc) #Boise
#nearest_neighbor(graph_of_cities, boise) #Salt Lake City
nearest_neighbor(graph_of_cities, sf) #Salt Lake City
