require_relative '../config/environment'
require 'pry'
# puts "hello world"



cli = CommandLineInterface.new
# cli.greet
# user_input = cli.user_input_for_name
# name = cli.create_new_user(user_input)
# flavor = cli.user_input_for_flavor(name)
# topping = cli.user_input_for_topping
# icecream = cli.create_new_ice_cream(flavor, topping)
# rating = cli.user_input_for_rating
# favorite = cli.add_favorite
# review = cli.create_new_review(name, icecream, rating, favorite)

# cli.all_reviews
cli.all_reviews_grater_then_number(8)
cli.changed_my_mined("Noa", "skateboard")
# cli.update_ice_cream_name("Vnilla", "!!!", "WHAT???")

# cli.find_ice_cream("vanilla", "reeses")
# cli.find_user_id("taci")