# prompt = TTY::Prompt.new
# prompt.ask("What is your name?", default: ENV["USER"])
require 'pry'
class CommandLine #class for CLI 
    def welcome 
        puts "Welcome to GITFIT"

        
#         puts "Do you have an account?"
        
        user_input = gets.chomp.downcase #asking for user input

        if user_input == 'yes'
            puts "What is your username?"
            username = gets.chomp.downcase
        
            if User.exists?(name: username)
                $user = User.find_by(name: username)
                puts ("Welcome back, #{$user.name}!").titleize #titleize capitalizes the first letter of a string
            else 
                puts "We could not find your username"
                add_new_user
            end
        else
            add_new_user
        end
    end

    def add_new_user
        puts "Please enter your username"
        username = gets.chomp
        if User.exists?(:name => username)
            puts "Username is taken, please try again"
            add_new_user
        else 
            new_user = User.create(name: username)
            $user = new_user
            puts "Hello, #{$user.name}!"

            puts "What is your fitness level?".titleize
            puts "Active"
            puts "Moderate"
            puts "Sedentary"
            fitness_level = gets.chomp.downcase
            
            $user.fitness_level = fitness_level
            puts "Your fitness level is #{fitness_level}"

            
#         end
#     end

#     def read_exercises #workouts
#         puts "want to read through the exercises?"
#         input = gets.chomp.downcase

#         if input == 'yes'
#             put "What exercise would you like to learn about?"
#             exercise = gets.chomp.downcase

#             Exercise.all.map {|exercise| "#{exercise.name} -  #{exercise.description}"}
#         else 
#             #something
#         end
#     end
    

    def new_session  #menu 

    end

    def find_all_sessions
        puts "Would you like to see all of your past sessions?(yes/no)"
        user_input = gets.chomp.downcase 
        binding.pry
        if user_input == 'yes'
            $user.workouts.each do |workout| 
                puts workout.exercise.name
                puts workout.exercise.description
                puts workout.exercise.body_part
                puts workout.sets
                puts workout.reps 
            end

        end

    end

    def name_session

    end

    def edit_session

    end

    def delete_session

    end
        
end


