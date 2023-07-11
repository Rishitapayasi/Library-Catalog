module CsvOperation

  def save_books_to_csv(books)

    CSV.open('books.csv', 'w') do |csv|
      csv << ['Title', 'Author', 'Genre', 'Year']
      books.each do |book|
      csv << [book.title, book.author, book.genre, book.year]
      end
    end

  end

  def load_books_from_csv

    CSV.foreach('books.csv', headers: true) do |row|
      title = row['Title']
      author = row['Author']
      genre = row['Genre']
      year = row['Year'].to_i
      

      book = Book.new(title, author, genre, year)
      @books << book
      end
    
  end


  def export_books_to_csv(books)
    empty_choices = 0
    max_empty_choices = 3
    loop do 
      puts "Enter the filename for exporting the books: "
      filename = gets.chomp

      if filename.empty? || filename.strip.empty?
        puts "field cannot be empty"
        empty_choices += 1
        if empty_choices >= max_empty_choices
          raise "Invalid input you enter 3 times,Returning to main menu..."
          empty_choices = 0
        end
      else
        CSV.open(filename, 'w') do |csv|
        csv << ['Title', 'Author', 'Genre', 'Year']
          books.each do |book|
          csv << [book.title, book.author, book.genre, book.year]
          end
        end
          puts "books exported to#{filename}"
          return
      end
    end
  end

  def save_books_to_csv(books)

    CSV.open('books.csv', 'w') do |csv|
      csv << ['Title', 'Author', 'Genre', 'Year']
      books.each do |book|
      csv << [book.title, book.author, book.genre, book.year]
      end
    end

  end

  def load_books_from_csv

    CSV.foreach('books.csv', headers: true) do |row|
      title = row['Title']
      author = row['Author']
      genre = row['Genre']
      year = row['Year'].to_i
      

      book = Book.new(title, author, genre, year)
      @books << book
      end
    
  end


  def export_books_to_csv(books)
    empty_choices = 0
    max_empty_choices = 3
    loop do 
      puts "Enter the filename for exporting the books: "
      filename = gets.chomp

      if filename.empty? || filename.strip.empty?
        puts "field cannot be empty"
        empty_choices += 1
        if empty_choices >= max_empty_choices
          raise "Invalid input you enter 3 times,Returning to main menu..."
          empty_choices = 0
        end
      else
        CSV.open(filename, 'w') do |csv|
        csv << ['Title', 'Author', 'Genre', 'Year']
          books.each do |book|
          csv << [book.title, book.author, book.genre, book.year]
          end
        end
          puts "books exported to#{filename}"
          return
      end
    end
  end
end