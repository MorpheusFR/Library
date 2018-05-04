# {project_root}/classes/library.rb

# require '../classes/author.rb'
# require '../classes/book.rb'
# require '../classes/order.rb'
# require '../classes/reader.rb'
# require '../backup/save_load.txt'
# require './generator_data.rb'
# require_relative 'order'
require_relative '../generator_data'

class Library
  # ./generator_data.rb
  include DataGenerator

  attr_accessor :authors, :books, :orders, :readers

  def initialize
    @authors = []
    @books = []
    @orders = []
    @readers = []
  end

  def save
    backup = []
    backup.push @authors, @books, @orders, @readers
    File.write("./backup/save_load.txt", backup)
  end

  def info
    file = File.readlines("./backup/save_load.txt", "r:UTF-8")
    file.each do |line|
      puts(line)
    end
  end
end
