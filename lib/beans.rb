require 'pry'

class CoffeeBreak::Beans 

    # Display collection of coffee with corresponding attributes
     
    attr_accessor :name, :label, :price, :details, :link

    # Stores every instance of Beans and anything collected from scrape methods will display in CLI.

    @@all = [] 

        def initialize(name, label, price, link, details=nil) 
            @name = name
            @label = label 
            @price = price
            @details = details
            @link = link
            @@all << self 
        end 

        def self.all
            @@all
        end

end 