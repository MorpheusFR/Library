# {project_root}/generator_data.rb
require_relative 'classes/reader'
require_relative 'classes/book'
require_relative 'classes/author'
require_relative 'classes/order'
require_relative 'classes/library'

# modul DataGenerator
module DataGenerator
  def book_data
    # 10 books
    @books << Book.new('Война миров', 'Герберт Уэллс')
    @books << Book.new('Звездный десант', 'Роберт Хайнлайн')
    @books << Book.new('История будущего', 'Айзек Азимов')
    @books << Book.new('Марсианские хроники', 'Рэй Брэдбери')
    @books << Book.new('День триффидов', 'Джон Уиндэм')
    @books << Book.new('Машина времени', 'Герберт Уэллс')
    @books << Book.new('Мальвиль', 'Робер Мерль')
    @books << Book.new('Я, робот', 'Айзек Азимов')
    @books << Book.new('Нейромант', 'Уильям Гибсон')
    @books << Book.new('2001: Космическая Одиссея', 'Артур Кларк')
  end

  def authors_data
    # 7 authors
    @authors << Author.new('Герберт Уэллс', 'Bio Герберт Уэллс')
    @authors << Author.new('Роберт Хайнлайн', 'Bio Роберт Хайнлайн')
    @authors << Author.new('Айзек Азимов', 'Bio Айзек Азимов')
    @authors << Author.new('Рэй Брэдбери', 'Bio Рэй Брэдбери')
    @authors << Author.new('Джон Уиндэм', 'Bio Джон Уиндэм')
    @authors << Author.new('Робер Мерль', 'Bio Робер Мерль')
    @authors << Author.new('Артур Кларк', 'Bio Артур Кларк')
  end

  def data_generate
    i = 1
    while i < 10
      @readers << Reader.new("User#{i}",
                             "user#{i}@example.com",
                             "city#{i}",
                             "street#{i}",
                             "house#{i}")
      i += 1
    end

    book_data()
    authors_data()

    # 4 orders generator in range order_count
    order_generate('Война миров', 4)
    order_generate('Я, робот', 3)
    order_generate('Нейромант', 20)
    order_generate('Машина времени', 7)
  end

  def order_generate(book, order_count)
    order_count.times do
      @orders << Order.new("#{book}",
                           "User#{rand(1..9)}",
                           "#{rand(1..31)}.#{rand(1..12)}.20#{rand(16..18)}")
    end
  end
end
