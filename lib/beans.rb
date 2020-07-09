require 'nokogiri'
require 'open-uri'

class Coffee_Break::Beans 

    # Display collection 
    attr_accessor :name, :label, :price, :details
    
    @@all = []

        def initialize(name, label, price, details) # Takes parameters into an array format
            @name = name 
            @label = label 
            @price = price
            @details = details
        end 

        def self.all
            @@all 
        end

end 