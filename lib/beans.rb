require 'pry'

class CoffeeBreak::Beans 

    # Display collection of coffee with corresponding attributes
     
    attr_accessor :name, :label, :price, :details

    # Stores every instance of Beans and anything collected from scrape methods will display in CLI.

    @@all = [] 

        def initialize(name, label, price, details) 
            @name = name
            @label = label 
            @price = price
            @details = details
        end 

        def self.all
            @@all
        end

end 