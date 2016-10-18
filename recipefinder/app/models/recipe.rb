
require 'httparty'

class Recipe
  include HTTParty

  ENV['FOOD2FORK_KEY'] = 'd938661a53966dbde85ef0fd5ef26d96'
  hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  base_uri "http://#{hostport}/api"
  default_params key: ENV['FOOD2FORK_KEY']
  format :json

  def self.for (keyword)
    get("", query: {query: keyword})["recipes"]
  end
end