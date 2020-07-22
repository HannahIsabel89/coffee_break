require 'nokogiri'
require 'open-uri'

module CoffeeBreak
    class Scraper 

        def scrape
            doc = Nokogiri::HTML(URI.open("https://playeronecoffee.com/collections/all-coffee/"))

            doc.css(".grid-view-item").each do |tag| # Filter through the page to access specific elements.
                
                name = tag.css(".grid-view-item__title").text.upcase # Text in UPPERCASE letters.
                label = tag.css("div.grid-view-item__level span.label").text.upcase # CSS Selector searches document, looking for desired Div class LABEL.
                price = tag.css("div.grid-view-item__meta span.product-price__price").text # Displays price per specific product.
                link = "https://playeronecoffee.com"+ tag.css("a.grid-view-item__link")[0][:href] # Grabs href to obtain desired product links.
                # details = Nokogiri::HTML(URI.open(link)).css("div.product-single__description p").text # Opens link, access element, and provide details.
                
                product = Beans.new(name, label, price, link) 
                # Product variable used to store all scraped data from tags onto argument format for Beans. 

                # Beans.all << product 
                # Everything about "product" will be stored onto the object, Beans. 

            end
            self.scrape_second_page
        end
        
        def scrape_details(product)
            details = Nokogiri::HTML(URI.open(product.link)).css("div.product-single__description p").text
            product.details = details
        end  

        def scrape_second_page 

            doc = Nokogiri::HTML(URI.open("https://playeronecoffee.com/collections/all-coffee?page=2"))

            doc.css(".grid-view-item").each do |tag| 
                
                name = tag.css(".grid-view-item__title").text.upcase
                label = tag.css("div.grid-view-item__level span.label").text.upcase 
                price = tag.css("div.grid-view-item__meta span.product-price__price").text 
                link = "https://playeronecoffee.com"+ tag.css("a.grid-view-item__link")[0][:href] 
                # details = Nokogiri::HTML(URI.open(link)).css("div.product-single__description p").text 
                
                product = Beans.new(name, label, price, link)

                # Beans.all << product 
            
            end 
        end 

    end 
end 