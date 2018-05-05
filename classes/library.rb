# {project_root}/classes/library.rb
require_relative '../generator_data'
require 'yaml'

class Library
  # {project_root}/generator_data.rb
  include DataGenerator

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
    File.write('./backup/backup_yaml.yml', backup.to_yaml)

    # File.write("./backup/save_load.txt", "#{backup}")
  end

  def load_data
    File.read('./backup/backup_yaml.yml')
    # File.write("./backup/save_load.txt", "#{backup}")
  end

  def info
    # file = File.readlines("./backup/save_load.txt", "r:UTF-8")
    # file = File.readlines("./backup/backup_yaml.yml")
    file = load_data
    # file.each do |line|
    #   puts(line)
    # end
    puts(file)
  end

  def often_takes_the_book
    @orders.group_by(&:reader).sort_by { |_reader, order| order.count }.reverse.dig(0)
  end

  def the_most_popular_book
    "Nill"
  end

  def list_top_book_user
    "Nill"
  end
end
