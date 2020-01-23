require 'pry'
require 'nokogiri'
require 'open-uri'



def get_townhall_email(town_name)
town_name=town_name.downcase.tr(" ","-")
page=Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/#{town_name}.html"))
search_email=page.xpath('//body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
return search_email
end

#TEST
#puts get_townhall_email("FONTENAY EN PARISIS")

def get_townhall_final_array
page=Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
t_n_a=town_name_array=page.xpath('//*[@class="lientxt"]').map { |node| node.text }
t_e_a=townhall_email_array=town_name_array.map { |town_name| get_townhall_email(town_name) }
townhall_hash=t_n_a.zip(t_e_a).to_h
townhall_hash=townhall_hash.map { |key,value| {key=>value} }
townhall_final_array=townhall_hash.to_a
return townhall_final_array.class
return townhall_final_array
end 


#LES LIGNES EN DESSSOUS SONT POUR TESTER UNE AUTRE METHODE
#array=Array.new
#townhall_s_hash=Hash.new
#townhall_hash.each { |key,value| townhall_s_hash[key]=value }
#townhall_s_hash.each {|i| array << i}
#puts array

#puts townhall_hash.class
#puts get_townhall_hash
