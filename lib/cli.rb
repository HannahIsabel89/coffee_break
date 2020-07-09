module Coffee_Break
  class CLI

    # Greet the user, runs CLI program

      def run 
        system("clear") # Clears terminal before starting CLI program
        greeting 
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
            list_options
          elsif input == "exit"
            exit_program
          else
            i = Integer(input , exception: false) # Parsed input to raise exception when not false
            if !i.nil? 
              puts i 
            else # Raises argument if input is wrong
            puts "Please try again." 
          end     
        end
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

      def display_coffee
        puts "Enter the number you'd like to know more about."
          input = gets.strip.to_i
          index = input-1
        puts "You chose #{input}.#{Coffee_Break::Beans.all[index].name}"
        puts "#{Coffee_Break::Beans.all[index].label}"
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

# puts Coffee_Break::CLI.new.start