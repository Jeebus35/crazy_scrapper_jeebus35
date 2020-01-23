require 'pry'
require 'nokogiri'
require 'open-uri'

page=Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))


def crypto_array
#création d'un array qui répertorie le symbole des cryptomonnaies
crypto_name_array=page.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]')
c_n_a=crypto_name_array.map { |n| n.text }

#création d'un array qui répertorie les prix des cryptomonnaies
crypto_price_array=page.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price"]')
c_p_a=crypto_price_array.map { |price| price.text.tr("$","").to_f }

#pour connaître le nombre de cryptommonaies et ainsi faire un test dans le fichier spec
return c_p_a.length

#création d'un hash à partir de nos deux arrays
crypto_hash=c_n_a.zip(c_p_a).to_h

#création de plusieurs mini-hash
crypto_hash=crypto_hash.map{|nam,pri| {nam => pri}}

#création d'un array de mini-hash
crypto_array=crypto_hash.to_a

#we check that cyrpto_array is really an array
return crypto_array.class
return crypto_array
end 
