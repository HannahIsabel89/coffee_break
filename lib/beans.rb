require 'nokogiri'
require 'httparty'

class Beans 

    # Display collection 
    attr_accessor :name, :label, :price, :url


        def initialize(name, price, details) # Takes parameters into an array format
            @name = name 
            @label = price 
            @price = details
            @url =  "https://playeronecoffee.com/collections/all-coffee"
        end 

        def roast_type(filter)

            url = https://playeronecoffee.com/collections/all-coffee
            doc = Nokogiri::HTML(open(url))
            filter_type = doc.search('.filtering-tag-item') # Filter by type: Dark, Medium, Light Roast
        end
        
end 
