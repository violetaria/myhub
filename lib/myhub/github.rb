module Myhub
  class Github
    include HTTParty
    base_uri "https://api.github.com"

    # Your code here too!
    def initialize
      @headers = {
        "Authorization"  => "token #{ENV["AUTH_TOKEN"]}",
        "User-Agent"     => "HTTParty"
      }
    end
  end
end
