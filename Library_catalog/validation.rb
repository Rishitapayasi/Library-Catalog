module Validation
  
  def validate_input(prompt)
    empty_choices = 0
    max_empty_choices = 3
    loop do
       puts prompt
       input = gets.chomp

        if input.empty? || input.strip.empty?
         puts "field cannot be empty"
        empty_choices += 1
        if empty_choices >= max_empty_choices
          raise "Invalid input you enter 3 times,Returning to main menu..."
          empty_choices = 0
        end
        else
          return input
        end
    end
  end

  def validate_string(prompt)
    empty_choices =0
    max_empty_choices = 3

    loop do 
      puts prompt
      input = gets.chomp

      if input.to_i.to_s == input || input.empty? || input.strip.empty? || input =~ /[^A-Za-z0-9]/
        puts "Field cannot be empty or no special character"
        empty_choices += 1
        if empty_choices >= max_empty_choices
          raise "Invalid input you enter 3 times,Returning to main menu..."
          empty_choices =0
        end
      else
        return input
      end
    end 
  end

  def validate_year(prompt)
    empty_choices = 0
    max_empty_choices = 3
    loop do 
      puts prompt
      input = gets.chomp.to_i

      if !(1950..2023).include?(input) 
        puts "The year should be a non empty value between 1950 to 2023"
        empty_choices += 1
        if empty_choices >= max_empty_choices
          raise "Invalid input you enter 3 times,Returning to main menu..."
          empty_choices =0
        end
      else
        return input
      end
    end
  end

  def validate_delete(prompt)
    empty_choices = 0
    max_empty_choices = 3
    loop do 
      puts prompt
      input = gets.chomp
        if input =~ /\D/ || input.empty? 
          puts "the field cannot be empty or no special character is allowed"
          empty_choices += 1
          if empty_choices >= max_empty_choices
            raise "you press enter 3 times redirecting to main menu"
            empty_choices = 0
          end
        else
          return input.to_i 
        end
    end 
  end

 


  def display_book_details(book)
    puts "Title: #{book.title}"
    puts "Author: #{book.author}"
    puts "Genre: #{book.genre}"
    puts "Year: #{book.year}"
  end

end






