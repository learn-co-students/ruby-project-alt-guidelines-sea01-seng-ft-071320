class CreateExercises < ActiveRecord::Migration[5.2]

  def change 
    create_table :exercises do |t|
    t.string :name
    t.integer :reps
    t.integer :sets 
    t.string :description
    t.string :body_part
    end
  end
  end
