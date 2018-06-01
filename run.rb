# {project_root}/run.rb
require_relative './classes/library'
require_relative './generator_data'

library = Library.new

library.data_generate
library.save_data

library.load_data
# library.info

# Resalt task
puts "Who often takes the book: \n #{library.often_takes_the_book}"
puts "What is the most popular book: \n #{library.the_most_popular_book.dig(0, 0)}"
puts "How many people ordered one of the three most popular books: \n #{library.list_top_book_user}"
