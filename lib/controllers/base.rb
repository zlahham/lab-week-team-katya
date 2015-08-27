require_relative '../helpers/app_helpers'

module VirtualAssistant
  module Routes
    class Base < Sinatra::Base
      use Rack::MethodOverride

      include AppHelpers
      set :views, proc { File.join(root, '..', 'views')}
      # set :public, proc { File.join(root, '../..', 'public')}
      register Sinatra::Flash
      enable :sessions
      set :session_secret, 'super_secret'
    end
  end
end
