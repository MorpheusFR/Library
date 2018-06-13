# {project_root}/classes/library.rb
require_relative '../generator_data'
require 'yaml'

# {project_root}/generator_data.rb
class Library
  include DataGenerator
  PATH_TO_DATA = './backup/backup_yaml.yml'.freeze

  attr_accessor :authors, :books, :orders, :readers

  def initialize
    @authors = []
    @books = []
    @orders = []
    @readers = []
  end

  def save_data
    backup = []
    backup.push @authors, @books, @orders, @readers
    File.write(PATH_TO_DATA, backup.to_yaml)
  end

  def load_data
    data = YAML.load(File.open(PATH_TO_DATA))
    # "@authors"
    @authors = data[0]
    # "@books"
    @books = data[1]
    # "@orders"
    @orders = data[2]
    # "@readers"
    @readers = data[3]
  end

  def often_takes_the_book
    group_sort = @orders.group_by(&:reader).sort_by { |_reader, order| order.count }
    group_sort_result = group_sort.reverse.dig(0, 0)
  end

  def the_most_popular_book
    group_sort = @orders.group_by(&:book).sort_by { |_book, order| order.count }
    group_sort_result = group_sort.reverse
  end

  def list_top_book_user
    group_sort = the_most_popular_book.first(3).collect { |_book, order| order }
    group_sort_result = group_sort.flatten.collect(&:reader).uniq.count
  end
end
