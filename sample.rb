require 'rest-client'
require 'json'

def fetch_people
  url = "http://swapi.co/api/people"
  response = RestClient.get(url)
  data = JSON.parse(response.body)
  data["results"]
end

def fetch_starships
  url = "http://swapi.co/api/starships"
  response = RestClient.get(url)
  data = JSON.parse(response.body)
  data["results"]
end

def get_peoples_names
  data = fetch_people
  data.map { |character| character["name"] }
end

def get_peoples_combined_mass
  data = fetch_people
  weights = data.map { |character| character["mass"].to_i }
  weights.reduce(:+)
end

def get_starships_names
  data = fetch_starships
  data.map { |character| character["name"] }
end

def get_cost_in_credits
  data = fetch_starships
  costs = data.map { |ship| ship["cost_in_credits"].to_i }
  costs.reduce(:+)
end

def calc_average
  get_cost_in_credits / fetch_starships.count
end

puts get_peoples_names
puts get_peoples_combined_mass
puts get_starships_names
puts get_cost_in_credits
puts calc_average
