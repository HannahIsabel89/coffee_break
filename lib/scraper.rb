require 'nokogiri'
require 'open-uri'
require 'byebug'

module Coffee_Break
    class Scraper 
        attr_accessor :name, :label, :price, :url

    @@all = []

        def initialize (name=nil, label=nil, price=nil)
            @name = name 
            @label = label 
            price = price
            @url = " "https://playeronecoffee.com/collections/all-coffee/""

        def self.all 
            @@all 
        end 
        
        def scrape
        doc = Nokogiri::HTML(open(URL))
        doc.css.each do |list|
            name = doc.css(".grid-view-item__title").text
            label = doc.css(".label").text
            price = doc.css("product-price__price").text
        end
        
        def roast_type(filter)

            url = https://playeronecoffee.com/collections/all-coffee
            doc = Nokogiri::HTML(open(url))
            filter_type = doc.search('.filtering-tag-item') # Filter by type: Dark, Medium, Light Roast
        end

        def self.display_product
            @@all.each.with_index(1) do |index, product, roast, pricetag|
                puts "#{index}. #{product.name}, #{product.roast}, #{product.price}"
            end
        end
end

