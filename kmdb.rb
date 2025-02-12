# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)
# - You are welcome to use external resources for help with the assignment (including
#   colleagues, AI, internet search, etc). However, the solution you submit must
#   utilize the skills and strategies covered in class. Alternate solutions which
#   do not demonstrate an understanding of the approaches used in class will receive
#   significant deductions. Any concern should be raised with faculty prior to the due date.

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# puts Studio.all.count
# puts Movie.all.count
# puts Actor.all.count
# puts Role.all.count

# Generate models and tables, according to the domain model.
# TODO!
# generated via terminal (rails generate model + each model name as above)

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

newStudio = Studio.new
newStudio["name"] = "Warner Bros."
newStudio.save

WB = Studio.find_by({"name" => "Warner Bros."})
batmanbegins = Movie.new
batmanbegins["title"] = "Batman Begins"
batmanbegins["year_released"] = 2005
batmanbegins["rated"] = "PG-13"
batmanbegins["studio_id"] = WB["id"]
batmanbegins.save

darkknight = Movie.new
darkknight["title"] = "The Dark Knight"
darkknight["year_released"] = 2008
darkknight["rated"] = "PG-13"
darkknight["studio_id"] = WB["id"]
darkknight.save

darkknightrises = Movie.new
darkknightrises["title"] = "The Dark Knight Rises"
darkknightrises["year_released"] = 2012
darkknightrises["rated"] = "PG-13"
darkknightrises["studio_id"] = WB["id"]
darkknightrises.save

# puts "movies: #{Movie.all.count}"

newActor = Actor.new
newActor["name"] = "Christian Bale"
newActor.save

newActor = Actor.new
newActor["name"] = "Michael Caine"
newActor.save

newActor = Actor.new
newActor["name"] = "Liam Neeson"
newActor.save

newActor = Actor.new
newActor["name"] = "Katie Holmes"
newActor.save

newActor = Actor.new
newActor["name"] = "Gary Oldman"
newActor.save

newActor = Actor.new
newActor["name"] = "Heath Ledger"
newActor.save

newActor = Actor.new
newActor["name"] = "Aaron Eckhart"
newActor.save

newActor = Actor.new
newActor["name"] = "Maggie Gyllenhaal"
newActor.save

newActor = Actor.new
newActor["name"] = "Tom Hardy"
newActor.save

newActor = Actor.new
newActor["name"] = "Joseph Gordon-Levitt"
newActor.save

newActor = Actor.new
newActor["name"] = "Anne Hathaway"
newActor.save

bb = Movie.find_by({"title" => "Batman Begins"})
dk = Movie.find_by({"title" => "The Dark Knight"})
dkr = Movie.find_by({"title" => "The Dark Knight Rises"})

CB = Actor.find_by({"name" => "Christian Bale"})
newRole = Role.new
newRole["character_name"] = "Bruce Wayne"
newRole["movie_id"] = bb["id"]
newRole["actor_id"] = CB["id"]
newRole.save


newRole = Role.new
newRole["character_name"] = "Alfred"
newRole["movie_id"] = bb["id"]
newRole["actor_id"] = Actor.find_by({"name" => "Michael Caine"})["id"]
newRole.save


newRole = Role.new
newRole["character_name"] = "Ra's Al Ghul"
newRole["movie_id"] = bb["id"]
newRole["actor_id"] = Actor.find_by({"name" => "Liam Neeson"})["id"]
newRole.save

newRole = Role.new
newRole["character_name"] = "Rachel Dawes"
newRole["movie_id"] = bb["id"]
newRole["actor_id"] = Actor.find_by({"name" => "Katie Holmes"})["id"]
newRole.save

newRole = Role.new
newRole["character_name"] = "Commissioner Gordon"
newRole["movie_id"] = bb["id"]
newRole["actor_id"] = Actor.find_by({"name" => "Gary Oldman"})["id"]
newRole.save


newRole = Role.new
newRole["character_name"] = "Bruce Wayne"
newRole["movie_id"] = dk["id"]
newRole["actor_id"] = Actor.find_by({"name" => "Christian Bale"})["id"]
newRole.save

newRole = Role.new
newRole["character_name"] = "Joker"
newRole["movie_id"] = dk["id"]
newRole["actor_id"] = Actor.find_by({"name" => "Heath Ledger"})["id"]
newRole.save

newRole = Role.new
newRole["character_name"] = "Harvey Dent"
newRole["movie_id"] = dk["id"]
newRole["actor_id"] = Actor.find_by({"name" => "Aaron Eckhart"})["id"]
newRole.save

newRole = Role.new
newRole["character_name"] = "Alfred"
newRole["movie_id"] = dk["id"]
newRole["actor_id"] = Actor.find_by({"name" => "Michael Caine"})["id"]
newRole.save

newRole = Role.new
newRole["character_name"] = "Rachel Dawes"
newRole["movie_id"] = dk["id"]
newRole["actor_id"] = Actor.find_by({"name" => "Maggie Gyllenhaal"})["id"]
newRole.save

newRole = Role.new
newRole["character_name"] = "Bruce Wayne"
newRole["movie_id"] = dkr["id"]
newRole["actor_id"] = Actor.find_by({"name" => "Christian Bale"})["id"]
newRole.save

newRole = Role.new
newRole["character_name"] = "Commissioner Gordon"
newRole["movie_id"] = dkr["id"]
newRole["actor_id"] = Actor.find_by({"name" => "Gary Oldman"})["id"]
newRole.save

newRole = Role.new
newRole["character_name"] = "Bane"
newRole["movie_id"] = dkr["id"]
newRole["actor_id"] = Actor.find_by({"name" => "Tom Hardy"})["id"]
newRole.save

newRole = Role.new
newRole["character_name"] = "John Blake"
newRole["movie_id"] = dkr["id"]
newRole["actor_id"] = Actor.find_by({"name" => "Joseph Gordon-Levitt"})["id"]
newRole.save

newRole = Role.new
newRole["character_name"] = "Selina Kyle"
newRole["movie_id"] = dkr["id"]
newRole["actor_id"] = Actor.find_by({"name" => "Anne Hathaway"})["id"]
newRole.save

# puts Role.inspect
# puts Movie.inspect
# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

for movie in Movie.all
    studio = Studio.find_by({"id" => movie.studio_id})
    studio = studio["name"]
    puts "#{movie.title} #{movie.year_released} #{movie.rated} #{studio}"

end


# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

# bb_roles = Role.where({"movie_id" => movie["id"]})
for role in Role.all
    actor = Actor.find_by({"id" => role["actor_id"]})
    film = Movie.find_by({"id" => role["movie_id"]})
    puts "#{film.title}    #{actor.name}    #{role.character_name}"
end




