class CommandLineInterface 

    def greet 
        puts "Hey, what's the scoop?"
    end
    
    # ask user's name
    def user_input_for_name
        puts "what is your name?"
        user_input = gets.strip
        user_input
    end
    # CREATE
    def create_new_user(user_input)
        User.find_or_create_by(name: user_input)
    end
 
    #ask user to choose a flavor
    def user_input_for_flavor(user_name)
        puts "hey #{user_name.name}, what's your flavor for today?"
        gets.strip
    end
    
    #ask user to choose toppings
    def user_input_for_topping
        puts "which topping to add?"
        gets.strip
    end
    
    #CREATE
    #if icecream with the same flavor and topping exists  
    #else create a new icecream
    def create_new_ice_cream(flavor, topping)
        IceCream.find_or_create_by(name: Faker::Hipster.word, flavors: flavor, toppings: topping)
    end
    
    #ask user to rate the icecream
    def user_input_for_rating
        puts "rating?"
        gets.strip
    end
    
    def add_favorite
        puts "Do you want to add this to your favorite?"
        puts "type 'Yes' or 'No'"
        input = gets.strip
        input == "Yes" ? input = true : input = false
        input
    end
                
    #CREATE: create a review
    def create_new_review(name, icecream, rating, favorite)
        Review.create(user_id: name.id, icecream_id: icecream.id, rating: rating.to_i, favorite: favorite)
        puts "Thanks #{name.name}"
    end

    def all_reviews
        # binding.pry
        puts Review.all
    end
    
    #READ :user can see all the other user's review,
    #array with Icecreams name
    def all_reviews_grater_then_number(number)
        new = Review.all.select do |review|
            review.rating >= number
        end
        result = new.map {|review| review.ice_cream.name}.uniq
        # binding.pry
        puts result
    end 

    #UPDATE:user can update favorites and rating 

    def changed_my_mined(name, ice_cream)
        user = User.all.find_by(name: name)
        icecream = IceCream.all.find_by(name: ice_cream)
        review = Review.where(user_id: user.id, icecream_id: icecream.id)
        puts "new rating?"
        new_rating = gets.strip
        # binding.pry
        review.select do |a| 
            a.update({rating:new_rating})
        end
        puts "we got ya"
    end

    # def update_ice_cream_name(flavor, topping, new_name)
    #     # icecream = find_ice_cream
    #     icecream.update(name:new_name)
    #     icecream.save
    # end
    
    
    #user can see the ice cream with the highest ratings
    #user can see all his favorites  icecreams
    
#     #READ: find the ice_cream_id so we can look for reviews for this id
#     def find_ice_cream(flavor, topping)
#         icecream = IceCream.find(flavors: flavor, toppings: topping)
#         icecream.id
#     end
#     # READ: find the user_id so we can look for all the favorite icecreams for this user
#     #array of icecreams names
#     def find_user_id(name)
#         user = User.all.find_by(name: name)
#         binding.pry
#         user.id
#     end

#     def update_review(name)
#         user =  User.all.find_by(name: name)
#         ice_cream = find_ice_cream

#     end
    
#     # def find_all_favorites
#     #     Review.where(favorite: true).find_each  |review|
#     # end
#     # => DELETE
    
#     #user can delete the review
    
end