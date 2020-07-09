require 'nokogiri'
require 'pry'

module Coffee_Break
    class Scraper 
        
        def scrape
            doc = Nokogiri::HTML(URI.open("https://playeronecoffee.com/collections/all-coffee/"))
            doc.css(".grid-view-item").each do |tag| # Access each tag from below
                
                name = tag.css(".grid-view-item__title").text
                label = tag.css("div.grid-view-item__level span.label").text # CSS Selector searches document, looking for Div-class that says label
                price = tag.css("div.grid-view-item__meta span.product-price__price").text
                link = "https://playeronecoffee.com"+ tag.css("a.grid-view-item__link")[0][:href]
                details = Nokogiri::HTML(URI.open(link)).css("div.product-single__description p").text
                product = Beans.new(name, label, price, details)
                Beans.all << product
            end
        end
        

    end 
end 