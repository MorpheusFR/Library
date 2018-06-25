require_relative '../generator_data'
require 'yaml'
# Class Library
class Library
  include DataGenerator
  attr_accessor :authors, :books, :orders, :readers

  PATH_TO_DATA_AUTORS = './backup/authors.yml'.freeze
  PATH_TO_DATA_BOOKS = './backup/books.yml'.freeze
  PATH_TO_DATA_ORDERS = './backup/orders.yml'.freeze
  PATH_TO_DATA_READERS = './backup/readers.yml'.freeze

  def initialize
    @authors = []
    @books = []
    @orders = []
    @readers = []
  end

  def save_data
    File.write(PATH_TO_DATA_AUTORS, @authors.to_yaml)
    File.write(PATH_TO_DATA_BOOKS, @books.to_yaml)
    File.write(PATH_TO_DATA_ORDERS, @orders.to_yaml)
    File.write(PATH_TO_DATA_READERS, @readers.to_yaml)
  end

  def load_data
    @authors = YAML.load(File.open(PATH_TO_DATA_AUTORS))
    @books = YAML.load(File.open(PATH_TO_DATA_BOOKS))
    @orders = YAML.load(File.open(PATH_TO_DATA_ORDERS))
    @readers = YAML.load(File.open(PATH_TO_DATA_READERS))
  end

  def often_takes_the_book
    @orders.group_by(&:reader).sort_by { |_reader, order| order.count }.reverse.
    dig(0, 0)
  end

  def the_most_popular_books
    @orders.group_by(&:book).sort_by { |_book, order| order.count }.reverse
  end

  def list_top_book_user
    the_most_popular_books.first(3).collect { |_book, order| order }.flatten.
    collect(&:reader).uniq.count
  end
end
