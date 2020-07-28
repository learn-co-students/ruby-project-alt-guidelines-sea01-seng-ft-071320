nathan = User.create(name: "Nathan", age: 27, fitness_level: "active")
darius = User.create(name: "Darius", age: 23, fitness_level: "active")

pushup = Exercise.create(name: "Push Up", description: "Push your body up and away from the ground", body_part: "Chest", sets: 10, reps: 10)
# pull_up = Exercise.create(name: "Pull Up")

workout0 = Workout.create(user_id: 1, exercise_id: 1)
workout1 = Workout.create(user_id: 1, exercise_id: 2)
workout2 = Workout.create(user_id: 1, exercise_id: 3)
workout3 = Workout.create(user_id: 1, exercise_id: 4)
workout4 = Workout.create(user_id: 1, exercise_id: 5)