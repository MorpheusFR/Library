module DataGenerator

  def dataGenerator
    i = 1
    while i < 10
      @readers << Reader.new(
        "User#{i}",
        "user#{i}@email.com",
        "city#{i}",
        "street#{i}",
        "house#{i}"
      )
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

    # 4 orders
    order_generator('Война миров', 4)
    order_generator('Я, робот', 12)
    order_generator('Нейромант', 3)
    order_generator('Машина времени', 7)
  end

  def order_generator(book, reader)
    reader.times(@orders << Order.new("#{book}", "User#{rand(1..9)}", "#{rand(1..31)}.#{rand(1..12)}.#{rand(2016..2018)}"))
  end
end
