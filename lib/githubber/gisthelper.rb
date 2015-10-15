require "pry"

module Githubber
  class Gisthelper
    include HTTParty
    base_uri "https://api.github,com"

    def initialize(auth_token)
      @auth = {
        "Authorization" => "token #{auth_token}",
        "User Agent" => "HTTParty"
      }
    end

#get the contents of a gist
  def gistlook(gist_id)
    gist = Gisthelper.get ("/gists/#{gist_id}", :headers => @auth)
    response = gist(gist_id)
    response['files'].values.first['content']

    end
  end