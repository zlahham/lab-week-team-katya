require_relative './base.rb'

module VirtualAssistant
  module Routes
    class UserController < Base
      
      get '/users/new' do
        haml :'users/new'
      end

    end
  end
end
