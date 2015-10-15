require "pry"

module Githubber
  class Teams
    include HTTParty
    base_uri "https://api.github,com"

    def initialize(auth_token)
      @auth = {
        "Authorization" => "token #{auth_token}",
        "User Agent" => "HTTParty"
      }
    end

    #lists all the teams in a given organization --> returns json
    def list_teams(org)
      Teams.get ("/orgs/#{org}/teams", :headers => @auth)
    end

    #gets the team specified by their ID number --> returns json
    def get_team(team_id)
      Teams.get ("/team/#{team_id}", :headers => @auth)
    end

    #lists all members of a specific team --> returns json
    def listmembers(team_id)
      Teams.get ("/teams/#{team_id}/members", :headers => @auth)
    end

    #gets a specific member of a specific team --> 204 = Is a member, 404 = Not a member
    def getmember(team_id, username)
      Teams.get ("/teams/#{team_id}/members/#{username}", :headers => @auth)
    end
  end
end