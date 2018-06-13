# {project_root}/classes/order.rb
class Order
  attr_reader :book, :reader, :date

  def initialize (book, reader, date)
    @book = book
    @reader = reader
    # @data = data
    @date = date
  end
end
