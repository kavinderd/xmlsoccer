
 describe 'Leagues' do 
   before(:all) { savon.mock!   }
   after(:all)  { savon.unmock! }

   before(:all) do
   	@client = Xmlsoccer::Client.new(api_key: "12345", api_type: 'Full')
   end

   describe "GetAllLeagues" do

   	before(:each) do
   	  message = {"ApiKey" => @client.api_key}
      fixture = File.read("spec/fixtures/request_manager/get_all_leagues.xml")
      response = {code: 200, headers: {}, body: fixture}
      savon.expects(:get_all_leagues).with(message: message).returns(response)
      @response = @client.get_all_leagues
   	end

   	it 'returns an array' do
     expect(@response).to be_an_instance_of(Array)
    end
    
    it 'responds to league attributes' do
      expect(@response).to include(HashedResponses::GetAllLeagues)
    end

   end
end
