class CommandLine
    def welcome 
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
