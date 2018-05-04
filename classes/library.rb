# {project_root}/classes/library.rb
require_relative '../generator_data'

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

  def save
    backup = []
    backup.push @authors, @books, @orders, @readers
    backup.split('#')
    File.write("./backup/save_load.txt", "#{backup}")
  end

  def info
    file = File.readlines("./backup/save_load.txt", "r:UTF-8")
    file.each do |line|
      puts(line)
    end
  end
end
