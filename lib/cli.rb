require_relative "./scraper.rb"
require_relative "./scraper2.rb"

module Coffee_Break
  class CLI

    # Greet the user, runs CLI program

      def run 
        system("clear") # Clears terminal before starting CLI program
        loading_message
        
        Scraper.new.scrape
        Scraper_2.new.scrape_second_page
        
        greeting 
        while menu != 'exit' # Terminal stays open unless user ends program

        end
      end

      def loading_message
        puts "Brewing coffee..." # Loading message before program starts
        puts "Grabbing favourite mug..."
        puts "Pouring into the mug..."
        puts " "
        puts "*slurps*"
        puts " "
        puts "+8 energy, +8 social, +8 vitality "
        puts " "

      end

      def greeting
        puts "Welcome to PlayerOneCoffee! Spill the beans, what would you like?"
        puts "☕️"
        puts "Enter the number you'd like to know more about."
        puts "Or type exit to stop the program."
        puts " "
        
      end
    
      def exit_program
        puts "Thanks for stopping by. Until next time!"
        exit

      end

      def menu
        list_options
        input = gets.strip.downcase

        if input == "i"
          puts " "
          # Blank space to show below if user enters. 

        elsif input != "exit"
          i = Integer(input , exception: false) 
          # Parsed input to raise exception when not false
          if !i.nil? 
            puts i 
            # Prints number user entered. 
            display_coffee(i-1)
            # Count starts at 0 for the computer, 1 for the user.
            display_again 

          else # Raises argument if input is wrong
            puts "Please try again." 
            
            end
          end
            input # User prompted to give input.
        end
      end 
    end 
    
      def list_options
        Coffee_Break::Beans.all.each_with_index do |product, index| 
          # Products are listed in numerical order with product name.
          puts "#{index+1} #{product.name}"
        
        end
      end

      def display_coffee(index)
        puts "You chose:"
        puts "#{Coffee_Break::Beans.all[index].name}"
        puts "#{Coffee_Break::Beans.all[index].label}"
        puts "#{Coffee_Break::Beans.all[index].price}"
        puts "#{Coffee_Break::Beans.all[index].details}"
        puts " "

        end 
          
      def display_again 
        puts "Would you like to see the menu again? [y/n]"
        answer = gets.strip.downcase

          if answer == "y"
            puts "Here you go!"
            menu

          elsif answer == "n"
            exit_program

        end  
      end