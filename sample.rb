require 'rest-client'
require 'json'

def get_names
  url = "https://swapi.co/api/people/1"
  response = RestClient.get(url)
  data = JSON.parse(response.body)
  # puts data.keys
  # data["results"].map { |character| character["name"] }
end
