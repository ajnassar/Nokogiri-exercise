require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://blog.shopittome.com/"
doc = Nokogiri::HTML(open(url))

counter = 1

doc.at_css("#content_inner").element_children.each_with_index do |node|
	#Due to the way the blog is organized, I cycle through h2 and div tags.
	if node.name == "h2"
		puts "#{counter}. #{node.text}"
	elsif node.name == "div"
		node.element_children.each do |div_node|
			#The second condition is because of the "pin it" button. We want to ignore the "pin it" button since it is not pertaining to the blog/sale.
		  if (( !div_node.at_css("img").nil?) and ( div_node.at_css("img")["title"].nil?))
		  	puts "-#{div_node.at_css("img")["src"]}"
		  end
		end
	counter+=1
	end	
end



