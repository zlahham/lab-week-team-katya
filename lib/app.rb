require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'controllers/base'
require_relative 'controllers/user'
require './lib/helpers/app_helpers'


module VirtualAssistant

  class App < Sinatra::Base

    include AppHelpers
    register Sinatra::Flash


    get '/' do
      haml :index
    end

    use Routes::UserController

    
    run! if app_file == $0
  end
end
