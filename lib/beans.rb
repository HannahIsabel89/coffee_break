require 'pry'

class Coffee_Break::Beans 

    # Display collection of coffee with corresponding attributes
     
    attr_accessor :name, :label, :price, :details

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