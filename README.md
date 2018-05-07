# Library

    Book: title, author
    Order: book, reader, date
    Reader: name, email, city, street, house
    Author: name, biography
    Library: books, orders, readers, authors

  Write program that determines:

    Who often takes the book
    What is the most popular book
    How many people ordered one of the three most popular books

    Save all Library data to file(s)
    Get all Library data from file(s)


# {project_root}/run.rb
run.rb

Generator data
```
# library.data_generate
```
Save data to YAML
```
# library.save_data
```
Load data
```
library.load_data
```
Information
```
library.info
```
Resalt task
# Who often takes the book
```
"#{library.often_takes_the_book}"
```
# What is the most popular book
```
"#{library.the_most_popular_book.dig(0, 0)}"
```
# How many people ordered one of the three most popular books
```
"#{library.list_top_book_user}"
```

Expected values without data generation
```
Who often takes the book:
 User3
What is the most popular book:
 Нейромант
How many people ordered one of the three most popular books:
 9
 ```
