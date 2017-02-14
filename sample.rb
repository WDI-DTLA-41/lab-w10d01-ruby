require 'rest-client'
require 'json'
require 'csv'

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

def men_women
  people_csv_file = File.read("people.csv")
  data = CSV.parse(people_csv_file)
  people_arr = []
  keys = data.slice(0)
  data.shift(1)
  data.map { |myobj|
    people_arr.push( Hash[ keys.zip(myobj) ] )
  }
  total_of_men = 0
  total_of_women = 0
  people_arr.map { |person|
    if person["gender"] == "m"
      total_of_men += 1
    else
      total_of_women += 1
    end
  }
  puts "The total number of men is: " + total_of_men.to_s
  puts "The total number of women is: " + total_of_women.to_s
  puts "The total number of people is: " + people_arr.size.to_s
end

def born_after_2000
  people_csv_file = File.read("people.csv")
  data = CSV.parse(people_csv_file)
  people_arr = []
  keys = data.slice(0)
  data.shift(1)
  data.map { |myobj|
    people_arr.push( Hash[ keys.zip(myobj) ] )
  }
  people_arr.map { |person|
    if person["dob"].to_i >= 2000
      full_name = person["given_name"].to_s + ' ' + person["surname"].to_s
      puts full_name
    end
  }
end

def get_starwars
  url = "https://swapi.co/api"
  response = RestClient.get(url)
  data = JSON.parse(response)
  starwars_api = File.open("starwars_api.rb", "w"){ |file|
    file.write(data)
  }
  result = File.read("starwars_api.rb")
  puts result
end

get_names
get_weight
get_starships
get_starships_cost
men_women
born_after_2000
get_starwars
