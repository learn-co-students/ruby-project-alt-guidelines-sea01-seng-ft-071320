
# prompt = TTY::Prompt.new
# prompt.ask("What is your name?", default: ENV["USER"])

class CommandLine
    def welcome 
        prompt = TTY::Prompt.new
        prompt.ask("What is your name?") do |q|
            q.required true
            q.validate /\A\w+\Z/
            q.modify   :capitalize
          end
        puts "Welcome to GITFIT"
        
        puts "Do you have an account?"
        

        user_input = gets.chomp.downcase

        if user_input == 'yes'
            puts "What is your username?"
            username = gets.chomp.downcase

            if User.exists?(:name => username)
                $user = User.find_by(name: username)
                puts ("Welcome back, #{$user.name}!"

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
        username = gets.chomp.downcase
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

    def read_exercises
        puts "want to read through the exercises?"
        input = gets.chomp.downcase

        if input == 'yes'
            put "What exercise would you like to learn about?"
            exercise = gets.chomp.downcase

            Exercise.all.select {|exercise| exercise == exercise}
            puts exercise.description
        else 
            #something
        end
    end
    
    #testingthis
    # what are you trying to do?
    #     1. start a Workout
    #     2. findsomeone 

    #     userinput = gets.chomp

    #     2. 

    #     if userinput == 2
    #         find_user

    # def find_user
    #     who are you looking for?
    #     name = gets.chomp

    #     User.all.select {|user| user.name == name}
    #     end 
    # end

    # def everyone 
    #     User.all.map {|user| user.name}
end

