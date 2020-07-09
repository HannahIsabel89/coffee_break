require 'nokogiri'
require 'pry'

module Coffee_Break
    class Scraper 

        def scrape
            doc = Nokogiri::HTML(URI.open("https://playeronecoffee.com/collections/all-coffee/"))
            doc.css(".grid-view-item").each do |tag| # Access each tag from below
                
                name = tag.css(".grid-view-item__title").text.upcase
                label = tag.css("div.grid-view-item__level span.label").text.upcase # CSS Selector searches document, looking for desired Div classes
                price = tag.css("div.grid-view-item__meta span.product-price__price").text # Displays price per specific product
                link = "https://playeronecoffee.com"+ tag.css("a.grid-view-item__link")[0][:href] # Grabs href to iterate through product links
                details = Nokogiri::HTML(URI.open(link)).css("div.product-single__description p").text # Opens product link to provide details
                product = Beans.new(name, label, price, details) # Calls on class Beans 
                Beans.all << product # Stores scraped data onto Beans class 
            end
        end


        

    end 
end 