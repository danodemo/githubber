
module Githubber
	class Issues
		include HTTParty
		base_uri "https://api.github.com"

		def initialize(auth_token)
			@auth = {
				"Authorization" => "token #{auth_token}",
				"User_Agent" => "HTTParty"
			}
		end

#add/open a new issue in the owner's repo.  title = "string
	def new(owner, repo, title, content, assignee)
			PullRequets.post("/repos/#{owner}/#{repo}/issues",
				:headers => @auth,
				:body => {"title" => title, "body" => content, "assignee" => assignee}.to_json)

#comment on an existing issue
		def comment(owner, repo, issue_num, comment)
			PullRequests.patch("/repos/#{owner}/#{repo}/issues/#{issue_num}", 
				:headers => @auth, 
				:body => { "body" => comment }.to_json)
		end

#list issues in the owner's repo
		def list_issues(owner, repo)
			PullRequests.get("/repos/#{owner}/#{repo}/issues", :headers => @auth)
		end


#close an already opened issue in the owner's repo MUST KNOW ISSUE NUMBER
		def close_issue(owner, repo, issue_num)
			PullRequests.patch("/repos/#{owner}/#{repo}/issues/#{issue_num}", 
				:headers => @auth, 
				:body => {"state" => "closed"}.to_json)
		end
	end
end
