require_relative '../helpers/app_helpers'

module VirtualAssistant
  module Routes
    class Base < Sinatra::Base

      enable :sessions

      set :views, proc { File.join(root, '..', 'views')}
    end
  end
end
