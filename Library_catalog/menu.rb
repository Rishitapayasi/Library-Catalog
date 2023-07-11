require_relative 'library_catalog'
require_relative 'validation'
require_relative 'csv_operation'

class Menu

  MAX_EMPTY_CHOICES = 3
  
  def display_menu
    puts "--- Library Catalog ---"
    puts "1. Add a Book"
    puts "2. Find Book by Title"
    puts "3. Find Books by Genre"
    puts "4. Find Books by Author"
    puts "5. display books"
    puts "6. Delete a Book"
    puts "7. update Book"
    puts "8. export book to csv"
    puts "9. exit"
    puts "---------------------------"
  end
    
  def run
    
    library = LibraryCatalog.new
    extend Validation
    extend CsvOperation
    empty_choices = 0

    loop do

      display_menu
      puts "Enter your choice: "
      choice = gets.chomp

      if choice.empty? || choice.strip.empty?
        empty_choices += 1
          if empty_choices >= MAX_EMPTY_CHOICES
            puts "You pressed Enter #{MAX_EMPTY_CHOICES} times. Redirecting"
            empty_choices = 0
            return
          end
      else
        choice = choice.to_i
      end

      case choice

      when 1

        begin
          library.add_book
        rescue  => e
          puts e.message
        end

      when 2

        begin
          title = validate_input('Enter the title of the book')
          library.find_book_by_title(title)
        rescue => e
          puts e.message 
        end

      when 3

        begin
          genre = validate_string('Enter the genre of the book') 
          library.find_books_by_genre(genre)
        rescue  => e 
          puts e.message 
        end

      when 4

        begin
          author = validate_string('Enter the author of the book')
          library.find_books_by_author(author)
        rescue => e 
          puts e.message 
        end

      when 5

        library.display_all_books

      when 6

        begin
          library.delete_book
        rescue => e
          puts e.message
        end

      when 7

        begin
          library.update_book
        rescue => e 
          puts e.message 
        end

      when 8

        begin
          export_books_to_csv(library.books)
        rescue  => e
          puts e.message
        end

      when 9

      puts "thanks for visting"
      break

     else
       puts "Invalid choice! Please enter a valid option."

     end

    end

  end

end
 
menu = Menu.new.run





