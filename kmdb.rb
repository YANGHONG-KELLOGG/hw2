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
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.

studio = Studio.new
studio["name"] = "Warner Bros."
studio.save

WB = Studio.find_by({"name"=>"Warner Bros."})

movie = Movie.new
movie["title"] = "Batman Begins"
movie["year_released"] = 2005
movie["rated"] = "PG-13"
movie["sutdio_id"] = WB["id"]
movie.save

movie = Movie.new
movie["title"] = "The Dark Knight"
movie["year_released"] = 2008
movie["rated"] = "PG-13"
movie["sutdio_id"] = WB["id"]
movie.save

movie = Movie.new
movie["title"] = "The Dark Knight Rises"
movie["year_released"] = 2012
movie["rated"] = "PG-13"
movie["sutdio_id"] = WB["id"]
movie.save

# Batman Begins

actor = Actor.new
actor["name"] = "Christian Bale"
actor.save

actor = Actor.new
actor["name"] = "Michael Caine"
actor.save

actor = Actor.new
actor["name"] = "Liam Neeson"
actor.save

actor = Actor.new
actor["name"] = "Katie Holmes"
actor.save

actor = Actor.new
actor["name"] = "Gary Oldman"
actor.save

ChristianBale = Actor.find_by({"name"=>"Christian Bale"})
MichaelCaine = Actor.find_by({"name"=>"Michael Caine"})
LiamNeeson = Actor.find_by({"name"=>"Liam Neeson"})
KatieHolmes = Actor.find_by({"name"=>"Katie Holmes"})
GaryOldman = Actor.find_by({"name"=>"Gary Oldman"})

BatmanBegins = Movie.find_by({"title"=>"Batman Begins"})

role = Role.new
role["movie_id"] = BatmanBegins["id"]
role["actor_id"] = ChristianBale["id"]
role["character_name"] = "Bruce Wayne"
role.save

role = Role.new
role["movie_id"] = BatmanBegins["id"]
role["actor_id"] = MichaelCaine["id"]
role["character_name"] = "Alfred"
role.save

role = Role.new
role["movie_id"] = BatmanBegins["id"]
role["actor_id"] = LiamNeeson["id"]
role["character_name"] = "Ra's Al Ghul"
role.save

role = Role.new
role["movie_id"] = BatmanBegins["id"]
role["actor_id"] = KatieHolmes["id"]
role["character_name"] = "Rachel Dawes"
role.save

role = Role.new
role["movie_id"] = BatmanBegins["id"]
role["actor_id"] = GaryOldman["id"]
role["character_name"] = "Commissioner Gordon"
role.save

# The Dark Knight

actor = Actor.new
actor["name"] = "Heath Ledger"
actor.save

actor = Actor.new
actor["name"] = "Aaron Eckhart"
actor.save

actor = Actor.new
actor["name"] = "Maggie Gyllenhaal"
actor.save

HeathLedger = Actor.find_by({"name"=>"Heath Ledger"})
AaronEckhart = Actor.find_by({"name"=>"Aaron Eckhart"})
MaggieGyllenhaal = Actor.find_by({"name"=>"Maggie Gyllenhaal"})

TheDarkKnight = Movie.find_by({"title"=>"The Dark Knight"})

role = Role.new
role["movie_id"] = TheDarkKnight["id"]
role["actor_id"] = ChristianBale["id"]
role["character_name"] = "Bruce Wayne"
role.save

role = Role.new
role["movie_id"] = TheDarkKnight["id"]
role["actor_id"] = HeathLedger["id"]
role["character_name"] = "Joker"
role.save

role = Role.new
role["movie_id"] = TheDarkKnight["id"]
role["actor_id"] = AaronEckhart["id"]
role["character_name"] = "Harvey Dent"
role.save

role = Role.new
role["movie_id"] = TheDarkKnight["id"]
role["actor_id"] = MichaelCaine["id"]
role["character_name"] = "Alfred"
role.save

role = Role.new
role["movie_id"] = TheDarkKnight["id"]
role["actor_id"] = MaggieGyllenhaal["id"]
role["character_name"] = "Rachel Dawes"
role.save

# The Dark Knight Rises

actor = Actor.new
actor["name"] = "Tom Hardy"
actor.save

actor = Actor.new
actor["name"] = "Joseph Gordon-Levitt"
actor.save

actor = Actor.new
actor["name"] = "Anne Hathaway"
actor.save

TomHardy = Actor.find_by({"name"=>"Tom Hardy"})
JosephGordonLevitt = Actor.find_by({"name"=>"Joseph Gordon-Levitt"})
AnneHathaway = Actor.find_by({"name"=>"Anne Hathaway"})

TheDarkKnightRises = Movie.find_by({"title"=>"The Dark Knight Rises"})

role = Role.new
role["movie_id"] = TheDarkKnightRises["id"]
role["actor_id"] = ChristianBale["id"]
role["character_name"] = "Bruce Wayne"
role.save

role = Role.new
role["movie_id"] = TheDarkKnightRises["id"]
role["actor_id"] = GaryOldman["id"]
role["character_name"] = "Commissioner Gordon"
role.save

role = Role.new
role["movie_id"] = TheDarkKnightRises["id"]
role["actor_id"] = TomHardy["id"]
role["character_name"] = "Bane"
role.save

role = Role.new
role["movie_id"] = TheDarkKnightRises["id"]
role["actor_id"] = JosephGordonLevitt["id"]
role["character_name"] = "John Blake"
role.save

role = Role.new
role["movie_id"] = TheDarkKnightRises["id"]
role["actor_id"] = AnneHathaway["id"]
role["character_name"] = "Selina Kyle"
role.save


# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!



# studio1=Studio.all
# puts studio1.inspect

# movie1=Movie.all
# puts movie1.inspect

# actor1=Actor.all
# puts actor1.inspect

# role1=Role.all
# puts role1.inspect


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.

movies = Movie.all

for movie in movies
    studio = Studio.find_by({"id"=>movie["sutdio_id"]})
    studio_name = studio["name"]
    movie_title = movie["title"]
    movie_year_released = movie["year_released"]
    movie_rated = movie["rated"]

    puts "#{movie_title} #{movie_year_released} #{movie_rated} #{studio_name}"
end 

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.

roles = Role.all

for role in roles
    movie = Movie.find_by({"id"=>role["movie_id"]}) # one role has only one movie
    movie_title = movie["title"]

    actor = Actor.find_by({"id"=>role["actor_id"]}) # one role has only one actor
    actor_name = actor["name"]

    role_character_name = role["character_name"]

puts "#{movie_title} #{actor_name} #{role_character_name}" 

end 

# rails runner kmdb.rb
# Yang Hong 02/05/2023 1:55 PM CST

