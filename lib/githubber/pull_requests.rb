require "pry"

module Githubber
	class PullRequests
		include HTTParty
		base_uri "https://api.github,com"

		def initialize(auth_token)
			@auth = {
				"Authorization" => "token #{auth_token}",
				"User Agent" => "HTTParty"
			}
		end
# get a pull request
		def get_pull(owner, repo, number)
			PullRequests.get("/repos/#{owner}/#{repo}/pulls/#{number}", headers: @auth)
		end
# create a pull request
		def new_pull(owner, repo, options={})
			PullRequests.post("/repos/#{owner}/#{repo}/pulls", headers: @auth, body: options.to_json)
		end
		# say if a pull request has been merged
		def merge?(owner, repo, number)
			PullRequests.get("/repos/#{owner}/#{repos}/pulls/#{number}/merge", headers: @auth)
		end
	end
binding.pry
end


