require 'rest-client'
require 'json'

def get_names
  url = "https://swapi.co/api/people"
  response = RestClient.get(url)
  data = JSON.parse(response)
  data["results"].map { |character| puts character["name"] }
end

def get_weight
  url = "https://swapi.co/api/people"
  response = RestClient.get(url)
  data = JSON.parse(response)
  all_weight = 0
  data["results"].map { |character|
    all_weight += character["mass"].to_i
    }
  puts "The cumulative weight of everyone is: " + all_weight.to_s
end

def get_starships
  url = "https://swapi.co/api/starships"
  response = RestClient.get(url)
  data = JSON.parse(response)
  data["results"].map { |ship|
    puts ship["name"]
  }
end

def get_starships_cost
  url = "https://swapi.co/api/starships"
  response = RestClient.get(url)
  data = JSON.parse(response)
  total_ship_cost = 0
  data["results"].map { |ship|
    ship_cost = ship["cost_in_credits"].to_i
    total_ship_cost += ship_cost
  }
  puts "The sum total of all ships is: " + total_ship_cost.to_s
  num_of_ships = data["results"].count
  puts "I am the total number of ships: " + num_of_ships.to_s
  avg_cost = total_ship_cost.to_f / num_of_ships.to_f
  puts "The average cost of a ship is: " + avg_cost.to_s
end

get_names
get_weight
get_starships
get_starships_cost
