require 'httparty'
require 'json'
require 'rubygems'

ENV["FOOD2FORK_KEY"] = "get api key from base_uri"

class Recipe
  include HTTParty
  base_uri 'http://food2fork.com/api'
  default_params key: ENV["FOOD2FORK_KEY"]

  def initialize(inputValue, searchItem)
    @options = { rId: inputValue, q: searchItem }
  end

  def search
    self.class.get("/get", { query: @options } )
  end

  def for(term)
    getInfo = self.class.get("/search", { query: { q: term } } )
    getInfoString = JSON.parse(getInfo)["recipes"].to_json
    puts getInfoString
  end

end

#Recipe.new(FOOD2FORK_KEY)
getRecipe = Recipe.new(2414, "gallina")
#puts getRecipe.search
puts getRecipe.for("gallo")


#puts  HTTParty.get("http://food2fork.com/api/search?key=yourKeyHere&q=gallo")
