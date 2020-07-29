
prompt = TTY::Prompt.new

class CommandLine #class for CLI 

prompt = TTY::Prompt.new
    def welcome 
        puts "Welcome to GITFIT"
        
        puts "Do you have an account?"
        
        user_input = gets.chomp.downcase #as king for user input

        if user_input == 'yes'
            puts "What is your username?"
            username = gets.chomp.downcase

            if User.exists?(:name => username)
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
            new_user = User.create(:name => username)
            $user = new_user
            puts "Hello, #{$user.name}!"

            puts "What is your fitness level?".titleize
            puts "Active"
            puts "Moderate"
            puts "Sedentary"
            fitness_level = gets.chomp.downcase
            username.fitness_level = fitness_level
            puts "Your fitness level is #{fitness_level}"
            
        end
    end

    def read_exercises #workouts
        puts "want to read through the exercises?"
        input = gets.chomp.downcase

        if input == 'yes'
            put "What exercise would you like to learn about?"
            exercise = gets.chomp.downcase

            Exercise.all.map {|exercise| "#{exercise.name} -  #{exercise.description}"}
        else 
            #something
        end
    end
    
    def find_all_workouts
    end

    def menu 
        require "tty-prompt"

        prompt = TTY::Prompt.new
    # new_session = "New Session"
    # review_previous_session = "Review Previous Sessions"
    # see_all_exercises = "See All Exercises"
    # view_last_session = "View Last Session"
    # choices = %w(new_session review_previous_session see_all_exercises view_last_session)
        prompt.select("What would you like to do?") do |menu|
            menu.enum "."
        
            menu.choice "New Session",-> {new_session} 
            menu.choice "Review Previous Sessions",->{review_previous_sessions}
            menu.choice "View Last Session",->{view_last_session}
            menu.choice "Learn About Exercises",->{read_exercises}
        end

        def read_exercises #workouts
            binding.pry
            # puts "want to read through the exercises?"
            # input = gets.chomp.downcase

            # if input == 'yes'
            #     put "What exercise would you like to learn about?"
            #     exercise = gets.chomp.downcase

                exercises = Exercise.all.map {|exercise| "#{exercise.name} -  #{exercise.description}"}
                exercises
            # else 
                #something
            # end
        end
    end

    def review_previous_session
        binding.pry
        puts "Here are your previous sessions"
        session
        self.workouts.
        def edit_session
        end
    end

    def new_session
    end

    def edit_sets #this would be something like user.workouts.first.repss = value
        puts "current sets: #{reps}"
        puts "How many sets did you want to do?"
    end

    def edit_sets #this would be something like self.workouts.first or select a workout.sets = value
        puts "current sets: #{sets}"
        puts "How many sets did you want to do?"
    # end
end
