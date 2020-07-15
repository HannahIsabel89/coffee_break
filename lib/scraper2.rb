require 'nokogiri'
require 'open-uri'

module CoffeeBreak
    class Scraper_2

        # Grabs additional products and info from the second page in the url.

        def scrape_second_page
            doc = Nokogiri::HTML(URI.open("https://playeronecoffee.com/collections/all-coffee?page=2"))

            doc.css(".grid-view-item").each do |tag| 
                
                name = tag.css(".grid-view-item__title").text.upcase
                label = tag.css("div.grid-view-item__level span.label").text.upcase 
                price = tag.css("div.grid-view-item__meta span.product-price__price").text 
                link = "https://playeronecoffee.com"+ tag.css("a.grid-view-item__link")[0][:href] 
                details = Nokogiri::HTML(URI.open(link)).css("div.product-single__description p").text 
                
                product = Beans.new(name, label, price, details)

                Beans.all << product 

            end
        end

    end 
end 