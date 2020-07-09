# module Coffee_Break
  class CLI

    # Greet the user, runs CLI program

      def run
        system("clear") # Clears terminal before starting CLI program
        greeting
        CLI Menu
        while menu != 'exit' # Menu stays open until user ends program
        end
        exit_program
      end
 
      def greeting
        puts "Welcome to PlayerOneCoffee! Spill the beans, what would you like?"
      end
    
      def exit_program
        puts "Thanks for stopping by. Until next time!"
      end

      def menu
        puts "Please enter menu to choose a coffee roast type."
        input = gets.strip.downcase
          if input == "menu"
            Coffee_Break::Coffee.all.each.with.index(1) do |list, index|
            puts "#{index}.#{list.title}"
          end
            list_options
          elsif input == "Exit"
            exit_program
          else
            puts "Please try again."
            menu
          end     
        end
      end
    
      def list_options
        puts <<-DOC.gsub /^\s*/, '' # Allows to print strings from the lines below
        1. Dark Roast
        2. Medium Roast
        3. Light Roast
          Enter exit to stop the program.
          DOC
      end
    
      def choose_option(input)
        case option # Based on user input, roast option will be displayed
        when "1"
          puts "You chose Dark Roast."
        when "2"
          puts "You chose Medium Roast."
        when "3"
          puts "You chose Light Roast."
          end
        end
      end  
  
      def display_coffee
        puts "Enter the number you'd like to know more about."
          input = gets.strip.to_i
          index = input-1
        puts "You chose #{input}.#{Coffee_Break::Beans.all[index].title}"
        puts "#{Coffee_Break::Beans.all[index].details}"
        puts "#{Coffee_Break::Beans.all[index].price}"
        show_again
          if input <= 0 || input > Coffee_Break::Beans.all.size
            puts "Please try again."
            display_again
          else
            end_of_program
          end 
        end

      def display_again
        puts "Would you like to see it one more time?"
        answer = gets.strip.downcase  
          if answer == "Yes" || answer == "y"
            puts "Here you go!"
            display_coffee 
          elsif answer == "No" || answer == "n"
            end_of_program
          else 
            puts "Please try again."
            display_again 
          end 
        end 
      end 

puts Coffee_Break::CLI.new.start