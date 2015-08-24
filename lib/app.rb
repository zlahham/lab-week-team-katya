require 'sinatra/base'
require_relative 'data_mapper_setup'
require_relative 'controllers/base.rb'
require_relative 'controllers/user.rb'
require './lib/helpers/app_helpers'


module VirtualAssistant

  class App < Sinatra::Base
    get '/' do
      "Welcome"
    end

    use Routes::UserController

    # start the server if ruby file executed directly
    run! if app_file == $0
  end
end
