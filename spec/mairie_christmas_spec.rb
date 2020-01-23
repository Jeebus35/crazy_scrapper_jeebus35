require_relative '../lib/mairie_christmas'


describe "the get_townhall_email method"do 
it "should return the email of the townhall when you enter the name of the town" do
	expect(get_townhall_email("SANNOIS")).to eq("secretariat.general@sannois.org")
    expect(get_townhall_email("Villiers LE BeL")).to eq("secretariatgeneral@ville-villiers-le-bel.fr")
end
end

describe "the get_townhall_final_array method" do
it "should return an array of mini-hash : each element of the array is a mini-hash shaped like {'town_name'=>'townhall_email'}" do
	expect(get_townhall_final_array.take(5)).not_to be_nil
	expect(get_townhall_final_array.length).to eq(185)
end
end
