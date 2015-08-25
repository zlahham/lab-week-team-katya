require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'
require_relative 'controllers/base'
require_relative 'controllers/user'
require_relative 'controllers/session'
require_relative 'controllers/tasks'
require './lib/helpers/app_helpers'


module VirtualAssistant

  class App < Sinatra::Base
    use Rack::MethodOverride

    include AppHelpers

    register Sinatra::Flash


    get '/' do
      haml :index
    end

    post '/' do
      if session[:user_id]
        user_id = session[:user_id]
        @task = Task.new(
            task: params[:task],
            location: params[:location],
            deadline: params[:deadline],
            user_id: user_id)
        params[:tags].split(' ').each do |t|
          tag = Tag.create(name: t)
          @task.tags << tag
        end
       @task.save
       redirect to('/')
          # else
          #   # flash.now[:errors] = @task.errors.full_messages
          #   haml :'tasks/new'
          # end
        # end
      end
    end

    use Routes::UserController
    use Routes::SessionController
    use Routes::TasksController


    run! if app_file == $0
  end
end
