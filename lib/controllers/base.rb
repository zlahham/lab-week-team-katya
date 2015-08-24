require_relative '../helpers/app_helpers'

module VirtualAssistant
  module Routes
    class Base < Sinatra::Base

      enable :sessions
      
      helpers do
        def current_user
          current_user ||= User.get(session[:user_id])
        end
      end

      set :views, proc { File.join(root, '..', 'views')}
    end
  end
end
