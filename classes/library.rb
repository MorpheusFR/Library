# library.rb
require '../classes/author.rb'
require '../classes/book.rb'
require '../classes/order.rb'
require '../classes/reader.rb'
# require '../backup/save_load.txt'
require '../generator_data.rb'

class Library
  # ../generator_data.rb
  include DataGenerator

  attr_accessor :author, :book, :order, :reader

  def initialize
    @authors = []
    @books = []
    @orders = []
    @readers = []
  end

  def save
    backup = []
    backup.push @authors, @books, @orders, @readers
    File.write("../backup/save_load.txt", "w:UTF-8")
  end

  def info
    file = File.readlines("../backup/save_load.txt", "r:UTF-8")
    file.each do |line|
      puts(line)
    end
    # file.each { |line| puts line }
    # "#{@author}, #{@book}, #{@order}, #{@reader}"
  end
end

library = Library.new
library.dataGenerator
library.save
