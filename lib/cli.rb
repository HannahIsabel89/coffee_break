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
        puts "+10 Stamina, +10 Charisma, +10 Vitality "
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
        puts " "
        puts "Thanks for stopping by. Until next time!"
        puts " "
        exit

      end

      def menu
        list_options
        input = gets.strip.downcase

        if input == "i"
          puts " "
          # Blank space to show below if user makes valid. 

        elsif input != "exit"
          i = Integer(input , exception: false) 
          # Parsed input to raise exception when not false
          if !i.nil? 
            puts i 
            # Prints number user entered. 
            display_coffee(i-1)
            # Count starts at 0 for the computer, 1 for the user.
            display_again 

          else  # Raises argument if input is wrong
            puts " "
            puts "Oops! Please try again."
            puts " " 
            
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
        puts " "
        puts "You chose:"
        puts " "
        puts "#{Coffee_Break::Beans.all[index].name}" 
        puts " "
        puts "#{Coffee_Break::Beans.all[index].label}"
        puts " "
        puts "#{Coffee_Break::Beans.all[index].price}"
        puts " "
        puts "#{Coffee_Break::Beans.all[index].details}"
        puts " "

        end 
          
      def display_again 
        puts "Would you like to see the menu again? [y/n]"
        answer = gets.strip.downcase

          if answer == "y"
            puts "Here you go!"
            puts " "
            puts " "
            menu

          elsif answer == "n"
            exit_program
          else 
            puts " "
            puts "Uh-oh! Please try again."
            puts " "

        end  
      end