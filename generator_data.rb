require_relative 'classes/reader'
require_relative 'classes/book'
require_relative 'classes/author'
require_relative 'classes/order'
require_relative 'classes/library'

# 10 books
BOOKS_ARRAY = [
  ['Война миров', 'Герберт Уэллс'],
  ['Звездный десант', 'Роберт Хайнлайн'],
  ['История будущего', 'Айзек Азимов'],
  ['Марсианские хроники', 'Рэй Брэдбери'],
  ['День триффидов', 'Джон Уиндэм'],
  ['Машина времени', 'Герберт Уэллс'],
  ['Мальвиль', 'Робер Мерль'],
  ['Я, робот', 'Айзек Азимов'],
  ['Нейромант', 'Уильям Гибсон'],
  ['2001: Космическая Одиссея', 'Артур Кларк']
].freeze

# 7 authors
AUTHORS_ARRAY = [
  ['Герберт Уэллс', 'Bio Герберт Уэллс'],
  ['Роберт Хайнлайн', 'Bio Роберт Хайнлайн'],
  ['Айзек Азимов', 'Bio Айзек Азимов'],
  ['Рэй Брэдбери', 'Bio Рэй Брэдбери'],
  ['Джон Уиндэм', 'Bio Джон Уиндэм'],
  ['Робер Мерль', 'Bio Робер Мерль'],
  ['Артур Кларк', 'Bio Артур Кларк']
].freeze

# modul DataGenerator
module DataGenerator
  def books_data(books_array)
    counter = 0
    while counter < books_array.length
      @books << Book.new(books_array[counter].first,
                         books_array[counter].last)
      counter += 1
    end
  end

  def authors_data(authors_array)
    counter = 0
    while counter < authors_array.length
      @authors << Author.new(authors_array[counter].first,
                             authors_array[counter].last)
      counter += 1
    end
  end

  def readers_data
    i = 1
    while i < 10
      @readers << Reader.new("User#{i}",
                             "user#{i}@example.com",
                             "city#{i}",
                             "street#{i}",
                             "house#{i}")
      i += 1
    end
  end

  def order_generate(book, order_count)
    order_count.times do
      @orders << Order.new(book.to_s,
                           "User#{rand(1..9)}",
                           "#{rand(1..31)}.#{rand(1..12)}.20#{rand(16..18)}")
    end
  end

  def data_generate
    books_data(BOOKS_ARRAY)
    authors_data(AUTHORS_ARRAY)
    readers_data

    # 4 orders generator in range order_count
    order_generate('Война миров', 14)
    order_generate('Я, робот', 13)
    order_generate('Нейромант', 21)
    order_generate('Машина времени', 7)
  end
end
