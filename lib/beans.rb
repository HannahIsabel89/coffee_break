require 'nokogiri'
require 'open-uri'

class Coffee_Break::Beans 

    # Display collection 
    attr_accessor :name, :label, :price, :url
    
    @@all = []

        def initialize(name, label, price) # Takes parameters into an array format
            @name = name 
            @label = label 
            @price = price
            @url = "https://playeronecoffee.com/collections/all-coffee"
        end 

        def self.all 
            @@all 
        end 

        def product
            @name = doc.css(".grid-view-item__title").text
        end 

        def roast_type
            @label = doc.search('.filtering-tag-item').text # Filter by type: Dark, Medium, Light Roast
        end

        def product_price
            @price = doc.css("product-price__price").text
        end 

end 
