require_relative '../lib/scrapping'



describe "the crypto_array method" do
it "should return an array of mini-hashes : each element of the array is a mini-hash shaped like {'crypto_name'=> crypto_price }" do
	expect(crypto_array.take(5)).not_to be_nil
	expect(crypto_array.length).to eq(200)
end
end
