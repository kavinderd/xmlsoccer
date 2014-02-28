
 describe 'Teams' do 
   before(:all) { savon.mock!   }
   after(:all)  { savon.unmock! }

   before(:all) do
   	@client = Xmlsoccer::Client.new(api_key: "12345", api_type: 'Full')
   end

   describe "GetAllTeams" do

   	 before(:each) do
   	   message = {"ApiKey" => @client.api_key}
       fixture = File.read("spec/fixtures/request_manager/get_all_teams.xml")
       response = {code: 200, headers: {}, body: fixture}
       savon.expects(:get_all_teams).with(message: message).returns(response)
       @response = @client.get_all_teams
     end

     it 'returns an array' do
       expect(@response).to be_an_instance_of(Array)
     end
        
     it 'responds to team attributes' do
       expect(@response).to include(HashedResponses::GetAllTeams)
     end

   end

   describe "GetAllTeamsByLeagueAndSeason" do

     before(:each) do
       message = {"ApiKey" => @client.api_key, league: "English Premier League", season_date_string: "1011"}
       fixture = File.read("spec/fixtures/request_manager/get_all_teams_by_league_and_season.xml")
       response = {code: 200, headers: {}, body: fixture}
       savon.expects(:get_all_teams_by_league_and_season).with(message: message).returns(response)
       @response = @client.get_all_teams_by_league_and_season(league: "English Premier League", season_date_string: "1011")
     end

     it 'returns an array' do
       expect(@response).to be_an_instance_of(Array)
     end
        
     it 'responds to team attributes' do
       expect(@response).to include(HashedResponses::GetAllTeamsByLeagueAndSeason)
     end

   end

  
 end
