#require "rubygems"
require "launchy"

abort("you need to specify you search like this :
ruby google_search.rb {search}") if ARGV.length == 0

q=ARGV.join("+")
url = "https://www.google.com/search?q=#{q}"
#https://www.google.com/search?q=coucou

puts "Tu cherches #{q.gsub("+"," ")} ?
C'est parti !"
Launchy.open(url)
