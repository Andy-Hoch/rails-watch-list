# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'json'

puts 'deleting...'
Bookmark.delete_all
List.delete_all
Movie.delete_all

puts 'creating new entries'
url = 'https://tmdb.lewagon.com/movie/top_rated'
hash = JSON.parse(URI.open(url).read)

hash['results'].each do |movie|
  title = movie['original_title']
  overview = movie['overview']
  poster_url = "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"
  rating = movie['vote_average']
  Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
end

puts "created new entries"

puts 'creating new entries'
url = 'https://tmdb.lewagon.com/movie/popular'
hash = JSON.parse(URI.open(url).read)

hash['results'].each do |movie|
  title = movie['original_title']
  overview = movie['overview']
  poster_url = "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"
  rating = movie['vote_average']
  Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
end

puts "created new entries"

puts 'creating new entries'
url = 'https://tmdb.lewagon.com/movie/trending'
hash = JSON.parse(URI.open(url).read)

hash['results'].each do |movie|
  title = movie['original_title']
  overview = movie['overview']
  poster_url = "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"
  rating = movie['vote_average']
  Movie.create(title: title, overview: overview, poster_url: poster_url, rating: rating)
end

puts "created new entries"
