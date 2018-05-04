# {project_root}/run.rb
require_relative './classes/library'
require_relative './generator_data'

library = Library.new
library.data_generate
library.save
library.info
