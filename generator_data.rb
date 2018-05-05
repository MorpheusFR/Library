# {project_root}/generator_data.rb
require_relative 'classes/reader'
require_relative 'classes/book'
require_relative 'classes/author'
require_relative 'classes/order'
require_relative 'classes/library'

module DataGenerator

  def data_generate
    i = 1
    while i < 10
      @readers << Reader.new("User#{i}", "user#{i}@example.com", "city#{i}", "street#{i}", "house#{i}")
      i += 1
    end
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

    # 7 authors
    @authors << Author.new('Герберт Уэллс', 'Bio Герберт Уэллс')
    @authors << Author.new('Роберт Хайнлайн', 'Bio Роберт Хайнлайн')
    @authors << Author.new('Айзек Азимов', 'Bio Айзек Азимов')
    @authors << Author.new('Рэй Брэдбери', 'Bio Рэй Брэдбери')
    @authors << Author.new('Джон Уиндэм', 'Bio Джон Уиндэм')
    @authors << Author.new('Робер Мерль', 'Bio Робер Мерль')
    @authors << Author.new('Артур Кларк', 'Bio Артур Кларк')

    # 4 orders generator in range order_count
    # @orders << Order.new("Война миров", "User1", "1.12.2018")
    order_generate("Война миров", 4)
    order_generate('Я, робот', 3)
    order_generate('Нейромант', 3)
    order_generate('Машина времени', 7)

  end

  def order_generate(book, order_count)
    # puts(book, order_count)
    order_count.times do
      @orders << Order.new("#{book}", "User#{rand(1..9)}", "#{rand(1..31)}.#{rand(1..12)}.20#{rand(16..18)}")
    end
  end
end
