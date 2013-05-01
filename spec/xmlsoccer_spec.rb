# encoding: utf-8
require 'spec_helper'
require "savon/mock/spec_helper"
require "fixtures/request_manager/hashed_responses"

describe Xmlsoccer do
  
  include Savon::SpecHelper
  include HashedResponses

  before(:all) { savon.mock!   }
  after(:all)  { savon.unmock! }
  
  it 'returns correct string for DEMO' do
    expect(Xmlsoccer::DEMO).to eq('Demo')
  end
  
  it 'returns correct string for FULL' do
    expect(Xmlsoccer::FULL).to eq('Full')
  end
  
  describe Xmlsoccer::RequestManager do
     
    
    it 'initializes with an api key and version' do
      (Xmlsoccer::RequestManager.new(api_key: 'testkey', api_type: Xmlsoccer::DEMO)).should be_an_instance_of(Xmlsoccer::RequestManager)
    end
    
    before do 
      @client = Xmlsoccer::RequestManager.new(api_key: 'testkey', api_type: Xmlsoccer::FULL)
    end
    
    it 'returns valid api key' do
      expect(@client.api_key).to eq('testkey')
    end
    
    it 'returns valid api type' do
      expect(@client.api_type).to eq(Xmlsoccer::FULL)
    end
    
    
    it 'returns valid base url' do
      expect(@client.base_url).to eq("http://www.xmlsoccer.com/FootballData.asmx?WSDL")
    end
    
    describe 'calls api methods:' do
      end
      
      describe 'GetAllLeagues' do
        before do
            message = {"ApiKey" => "testkey"}
            fixture = File.read("spec/fixtures/request_manager/get_all_leagues.xml")

            response = {code: 200, headers: {}, body: fixture}
            savon.expects(:get_all_leagues).with(message: message).returns(response)
            @array = @client.get_all_leagues
        end
        
         it 'returns an array' do
           expect(@array).to be_an_instance_of(Array)
          end
          
          it 'responds to league attributes' do
            expect(@array).to include(HashedResponses::GetAllLeagues)
          end
      end
      
      describe 'GetAllTeams' do 
        before do
          message = {"ApiKey" => "testkey"}
          fixture = File.read("spec/fixtures/request_manager/get_all_teams.xml")

          response = {code: 200, headers: {}, body: fixture}
          savon.expects(:get_all_teams).with(message: message).returns(response)
          @array = @client.get_all_teams
        end
        
        it 'returns an array' do 
          expect(@array).to be_an_instance_of(Array)
        end
        
        it 'responds to team attributes' do
          expect(@array).to include(HashedResponses::GetAllTeams)
        end
      end
      
      describe 'GetAllTeamsInLeague' do
        before do
          message = {"ApiKey" => "testkey",
                      "league" => "English Premier League", "seasonDateString" => "1011"}
          fixture = File.read("spec/fixtures/request_manager/get_all_teams_by_league_and_season.xml")                                  
          response = {code: 200, headers: {}, body: fixture}
          savon.expects(:get_all_teams_by_league_and_season).with(message: message).returns(response)
          @array = @client.get_teams_in_league("English Premier League", "1011")
        end
        
        it 'returns an array' do
          expect(@array).to be_an_instance_of(Array)
        end
        
        it 'responds to team attributes' do
          expect(@array).to include(HashedResponses::GetAllTeams)
        end
        
      end
     
      
      it 'gets all teams in a league'
      
      it 'gets fixtures by a date interval'
      
      it 'gets fixtures by date interval and league'
      
      it 'gets fixtures by date interval and team'
      
      it 'gets historic matches by fixture id'
      
      it 'gets historic match by id'
      
      it 'gets historic matches by league and date interval'
      
      it 'gets historic matches by league and season'
      
      it 'gets historic matches by team and date interval'
      
      it 'gets historic matches between teams date interval'
      
    
  end
end

