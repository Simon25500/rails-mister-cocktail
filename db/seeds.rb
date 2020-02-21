# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'
require 'open-uri'
Ingredient.destroy_all
url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

openning = open(url).read
parsing = JSON.parse(openning)
parsing["drinks"].each do |x|
    Ingredient.new(name: x["strIngredient1"]).save!
end

Cocktail.destroy_all
%w[The data can then be loaded with].each do |x| 
    Cocktail.new(name: x).save!
end
