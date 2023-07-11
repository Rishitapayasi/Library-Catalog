require 'csv'
require_relative 'book'
require_relative 'csv_operation'
require_relative 'validation'


class LibraryCatalog

  include CsvOperation
  include Validation
  attr_reader :books

  def initialize
    @books = []
    load_books_from_csv
  end
  
  def add_book

    begin

      title = validate_input("Enter the title of the book:") 

      author = validate_string("Enter the author of the book:") 

        if @books.any? { |book| book.author == author && book.title == title }
          puts "An author can write only one book with the same title."
          return
        end

      genre = validate_string("Enter the genre of the book:") 

      year = validate_year("Enter the year of publication:") 

      book = Book.new(title, author, genre, year)
      @books << book
      save_books_to_csv(@books)
      puts "  ** Book added successfully **  "
    
    rescue => e
      
    raise
    end
    
  end


  def find_book_by_title(title)

    found_books = @books.select { |book| book.title.match?(title) }
    if found_books.empty?
      puts "No book found with the title '#{title}'."
    else
      puts "Books found with the title '#{title}':"
      display_books(found_books)
    end

  end

  def find_books_by_genre(genre)

     found_books = @books.select { |book| book.genre.match?(genre) }

      if found_books.empty?
        puts "No books found with the genre '#{genre}'."
      else
        puts "Books found with the genre '#{genre}':"
        display_books(found_books)
      end

  end

  def find_books_by_author(author)

    found_books = @books.select { |book| book.author.match?(author) }

    if found_books.empty?
      puts "No books found by the author '#{author}'."
    else
      puts "Books found by the author '#{author}':"
      display_books(found_books)
    end

  end

  def display_books(books)

    books.each.with_index(1) do |book , ind|
      puts "id: #{ind}"
      puts "Title: #{book.title}"
      puts "Author: #{book.author}"
      puts "Genre: #{book.genre}" 
      puts "Year: #{book.year}"
      puts "---------------------------"
    end

  end

  def display_all_books

    if @books.empty?
      puts "No books in the library."
    else
      puts "All Books in the Library:"
      display_books(@books)
    end

  end

  def delete_book

    begin

      delete_index = validate_delete('Enter the id of the book you want to delete:')
        delete_index -= 1
      if delete_index >= 0 && delete_index < @books.length
        deleted_book = @books.delete_at(delete_index)
        save_books_to_csv(@books)
        puts "Book at id #{delete_index + 1} has been deleted: #{deleted_book.title} by #{deleted_book.author}"
      else
        puts "Invalid id. No book found at id #{delete_index}."
      end

    
    rescue  => e
     
    raise
    end

  end


  def update_book

    begin
    
      update_title = validate_input('Enter the title of the book you want to update:')
      book = @books.find { |book| book.title.match?(update_title) }

      if book

        puts 'Book found:'
        display_book_details(book)

        update_title = validate_input('Enter the new title of the book')
        book.title = update_title

        update_author = validate_input('Enter the new author of the book')
        book.author = update_author 

        update_genre =validate_input('Enter the new genre of the book') 
        book.genre = update_genre 

        update_year = validate_year('Enter the new year of publication')
        book.year = update_year.to_i 

        save_books_to_csv(@books)
        puts 'Book updated successfully:'
        display_book_details(book)

      else

        puts 'No book found with this title.'

      end

      
      rescue  => e
        
      raise
    end
  end

  def books
    @books 
  end

end





