require_relative '../helpers/app_helpers'

module VirtualAssistant
  module Routes
    class Base < Sinatra::Base
      include AppHelpers
      set :views, proc { File.join(root, '..', 'views')}
      register Sinatra::Flash
      enable :sessions
    end
  end
end
