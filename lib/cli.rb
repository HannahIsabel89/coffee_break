require_relative "./scraper.rb"

module Coffee_Break
  class CLI

    # Greet the user, runs CLI program

      def run 
        system("clear") # Clears terminal before starting CLI program
        loading_message
        Scraper.new.scrape
        greeting 
        while menu != 'exit' # Menu stays open unless user ends program
        end
      end

      def loading_message
        puts "Brewing coffee..." # Loading message before program starts
        puts "Grabbing a mug..."
        puts "Pouring greatness..."
        puts " "
        puts "*slurps*"
        puts " "
        puts "+8 energy, +8 social, +8 vitality "
        puts " "
      end

      def greeting
        puts "Welcome to PlayerOneCoffee! Spill the beans, what would you like?" 
        puts "Enter menu to view."
        puts "Or enter exit to stop the program."
      end
    
      def exit_program
        puts "Thanks for stopping by. Until next time!"
        exit
      end

      def menu
        input = gets.strip.downcase
        if input == "menu"
          puts " "
          list_options
        elsif input != "exit"
          i = Integer(input , exception: false) # Parsed input to raise exception when not false
          if !i.nil? 
            puts i # Prints number user entered. 
            display_coffee 
            display_again
          else # Raises argument if input is wrong
            puts "Please try again." 
          end
        end
          input
      end
    end 
  end 
    
      def list_options
        puts <<-DOC.gsub /^\s*/, '' # Allows to print strings from the lines below
        1. Dark Roast
        2. Medium Roast
        3. Light Roast
          DOC
      end

      def display_coffee
        puts "Enter the number you'd like to know more about."
          input = gets.strip.to_i
          index = input-1
        puts "You chose:"
        puts "#{Coffee_Break::Beans.all[index].name}"
        puts "#{Coffee_Break::Beans.all[index].label}"
        puts "#{Coffee_Break::Beans.all[index].price}"
        puts "#{Coffee_Break::Beans.all[index].details}"
        puts " "
        display_again
          if input <= 0 || input > Coffee_Break::Beans.all.size
            puts "Please try again."
            display_again
          end 
        end 
          
      def display_again
        puts "Would you like to see the menu one more time? [y/n]"
        answer = gets.strip.downcase  
          if answer == "y"
            puts "Here you go!"
            menu
            list_options
          elsif answer == "n"
          exit_program
          end  
        end 

