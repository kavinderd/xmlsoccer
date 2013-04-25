require "xmlsoccer/version"
require 'savon'

module Xmlsoccer
  
    DEMO = "Demo"
    FULL = "Full"
  class RequestManager
    @api_key = ""
    @api_type = "Demo"
    @base_url
  
    WAIT = 'Wait 5 minutes between calls'
  
   # client.call(:get_all_teams) do message("ApiKey"=> "EDDATSZVPAOEFAAEJOXZBUAAJAKDGUKPMJYVZPJQKLOGUHNTLG") end
  
    def initialize(options={})
      @api_key = options[:api_key]
      @api_type = options[:api_type]
      if @api_type == DEMO
        @base_url = "http://www.xmlsoccer.com/FootballDataDemo.asmx?WSDL"
      elsif @api_type == FULL
        @base_url = "http://www.xmlsoccer.com/FootballData.asmx?WSDL"
      end
      @client = Savon.client(wsdl: @base_url)
    end
  
    def get_all_leagues
      if @last_call && @last_call > 60.minutes.ago
          return WAIT
      else
        response = @client.call(:get_all_leagues, message:{"ApiKey" => @api_key})
      
        leagues = []
        response.hash[:envelope][:body][:get_all_leagues_response][:get_all_leagues_result][:xmlsoccer_com][:league].each do |league|
          leagues.push(Xmlsoccer::League.new(league[:id], league[:name], league[:country]))
        end
        @last_call =Time.now
        return leagues
      end
    end
  
    def get_all_teams
       if  @last_call && @last_call > 60.minutes.ago
          return WAIT
       else
          response = @client.call(:get_all_teams, message:{"ApiKey" => @api_key})
          teams = []
          response.hash[:envelope][:body][:get_all_teams_response][:get_all_teams_result][:xmlsoccer_com][:team].each do |team|
            puts ""
            teams.push(Xmlsoccer::Team.new(team[:id], team[:name], team[:country], team[:stadium]))
          end
          @last_call =Time.now
          return teams
       end
    end
  
    def get_teams_in_league(league, season_year)
      if  @last_call && @last_call > 5.minutes.ago
        return WAIT
      else
        response = @client.call(:get_all_teams_by_league_and_season, message: {"ApiKey" => @api_key, "league" => league, "seasonDateString" => season_year})
        @last_call = Time.now
        return response.hash[:envelope][:body][:get_all_teams_by_league_and_season_response][:get_all_teams_by_league_and_season_result][:xmlsoccer_com][:team]
      end
    end
  
    def get_fixtures_by_date_interval(start_date, end_date)
      if  @last_call && @last_call > 5.minutes.ago
        return WAIT
      else
        response = client.call(:get_fixtures_by_date_interval) do
          message("ApiKey" => @api_key,
                      "startDateString" => start_date.strftime("%Y-%m-%d"),
                      "endDateString" => end_date.strftime("%Y-%m-%d"))
        end
        response = response.hash          
        return response[:envelope][:body][:get_fixtures_by_date_interval_response][:get_fixtures_by_date_interval_result][:xmlsoccer_com][:match]
      end
    end
  
    def get_fixtures_by_date_interval_and_league(league, start_date, end_date)
      if  @last_call && @last_call > 5.minutes.ago
        return WAIT
      else
        response = client.call(:get_fixtures_by_date_interval_and_league) do
          message("ApiKey" => @api_key,
                      "league" => league,
                      "startDateString" => start_date.strftime("%Y-%m-%d"),
                      "endDateString" => end_date.strftime("%Y-%m-%d"))
        end
        response = response.hash 
        return response[:envelope][:body][:get_fixtures_by_date_interval_and_league_response][:get_fixtures_by_date_interval_and_league_result][:xmlsoccer_com][:match]
      end
    end
  
    def get_fixtures_by_date_interval_and_team(team, start_date, end_date)
      if  @last_call && @last_call > 5.minutes.ago
        return WAIT
      else
        response = client.call(:get_fixtures_by_date_interval_and_team) do
          message("ApiKey" => @api_key,
                      "team" => league,
                      "startDateString" => start_date.strftime("%Y-%m-%d"),
                      "endDateString" => end_date.strftime("%Y-%m-%d"))
        end
        response = response.hash   
        return response[:envelope][:body][:get_fixtures_by_date_interval_and_team_response][:get_fixtures_by_date_interval_and_team_result][:xmlsoccer_com][:match]
      end
    end
  
    def get_historic_matches_by_fixture_match_id(fixture_id)
      if  @last_call && @last_call > 5.minutes.ago
        return WAIT
      else
        response = client.call(:get_historic_matches_by_fixture_match_id) do
          message("ApiKey" => @api_key,
                      "id" => id)
        end
        response = response.hash          
        matches = response[:envelope][:body][:get_historic_matches_by_fixture_match_id_response][:get_historic_matches_by_fixture_match_id_result][:xmlsoccer_com][:match]
        return matches
      end
    end
  
    def get_historic_matches_by_id(match_id)
      if  @last_call && @last_call > 5.minutes.ago
        return WAIT
      else
        response = client.call(:get_historic_matches_by_id) do
          message("ApiKey" => @api_key,
                      "id" => id)
        end
        response = response.hash          
        matches = response[:envelope][:body][:get_historic_matches_by_id_response][:get_historic_matches_by_id_result][:xmlsoccer_com][:match]
        return matches
      end
    end
  
    def get_historic_matches_by_league_and_date_interval(league, start_date, end_date)
      if  @last_call && @last_call > 5.minutes.ago
        return WAIT
      else
        response = client.call(:get_historic_matches_by_league_and_date_interval) do
          message("ApiKey" => @api_key,
                      "league" => league, 
                      "startDateString" => start_date.strftime("%Y-%m-%d"),
                      "endDateString" => end_date.strftime("%Y-%m-%d"))
        end
        response = response.hash          
        matches = response[:envelope][:body][:get_historic_matches_by_league_and_date_interval_response][:get_historic_matches_by_league_and_date_interval_result][:xmlsoccer_com][:match]
        return matches
      end
    end
  
    def get_historic_matches_by_league_and_season(league, interval)
      if  @last_call && @last_call > 5.minutes.ago
        return WAIT
      else
        response = client.call(:get_historic_matches_by_league_and_season) do
          message("ApiKey" => @api_key,
                      "league" => league, "seasonDateString" => interval)
        end
        response = response.hash          
        matches = response[:envelope][:body][:get_historic_matches_by_league_and_season_response][:get_historic_matches_by_league_and_season_result][:xmlsoccer_com][:match]
        return matches
      end
    end
  
    def get_historic_matches_by_team_and_date_interval(team, start_date, end_date)
      if  @last_call && @last_call > 5.minutes.ago
        return WAIT
      else
        response = client.call(:get_historic_matches_by_team_and_date_interval) do
          message("ApiKey" => @api_key,
                      "teamId" => team,
                      "startDateString" => start_date.strftime("%Y-%m-%d"),
                      "endDateString" => end_date.strftime("%Y-%m-%d"))
        end
        response = response.hash          
        matches = response[:envelope][:body][:get_historic_matches_by_team_and_date_interval_response][:get_historic_matches_by_team_and_date_interval_result][:xmlsoccer_com][:match]
        return matches
      end
    end
  
    def get_historic_matches_by_teams_and_date_interval(team_1, team_2, start_date, end_date)
      if  @last_call && @last_call > 5.minutes.ago
        return WAIT
      else
        response = client.call(:get_historic_matches_by_teams_and_date_interval) do
          message("ApiKey" => @api_key,
                      "team1Id" => team_1,
                      "team2Id" => team_2,
                      "startDateString" => start_date.strftime("%Y-%m-%d"),
                      "endDateString" => end_date.strftime("%Y-%m-%d"))
        end
        response = response.hash          
        matches = response[:envelope][:body][:get_historic_matches_by_teams_and_date_interval_response][:get_historic_matches_by_teams_and_date_interval_result][:xmlsoccer_com][:match]
        return matches
      end
    end
  end
  
end
