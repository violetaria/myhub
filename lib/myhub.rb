require "sinatra/base"
require "httparty"
require "pry"

require "myhub/version"
require "myhub/github"

module Myhub
  class App < Sinatra::Base
    set :logging, true

    # Your code here ...

    run! if app_file == $0
  end
end
