module Myhub
  class Github
    include HTTParty
    base_uri "https://api.github.com"

    def initialize
      @headers = {
        "Authorization"  => "token #{ENV["AUTH_TOKEN"]}",
        "User-Agent"     => "HTTParty"
      }
    end

    def get_issues(owner,repo,options={})
      response = self.class.get("/repos/#{owner}/#{repo}/issues",
                                headers: @headers,
                                query: options)
      response.map {|issue| { issue["id"] => {title: issue["title"], url: issue["url"]}, state: issue["state"] } }
    end

    def close_issue(owner,repo,id)
      self.class.patch("/repos/#{owner}/#{repo}/issues/#{id}",
                       :headers => @headers,
                       :body => {state: "closed"}.to_json)
    end

    def open_issue(owner,repo,id)
      self.class.patch("/repos/#{owner}/#{repo}/issues/#{id}",
                       :headers => @headers,
                       :body => {state: "open"}.to_json)
    end

  end
end

# api = Myhub::Github.new

# api.get_issues("TIY-ATL-ROR-2015-Sep","assignments", { assignee: "violetaria", state: "all" })

# binding.pry