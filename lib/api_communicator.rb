require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name, link = "http://www.swapi.co/api/people/")
  #make the web request
  response_string = RestClient.get(link)
  response_hash = JSON.parse(response_string)

  # arr =[]
  arr = []
 response_hash["results"].each do |post|
   # binding.pry
     if post["name"] == character_name
        post["films"].each do |links|
          arr << print_movies(links)
        end
        puts arr
        return arr
     end

   end
   get_character_movies_from_api(character_name, response_hash["next"])
 end
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
    response_string = RestClient.get(films)
    response_hash = JSON.parse(response_string)
    response_hash["title"]
end

# def show_character_movies(character)
#   films = get_character_movies_from_api(character)
#   print_movies(films)
# end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
