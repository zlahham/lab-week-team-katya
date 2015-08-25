require_relative './base.rb'

module VirtualAssistant
  module Routes
    class IndexController < Base

      get '/' do
        if session[:user_id]
          @tasks = Task.all
        end
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
            tag = Tag.create(tag_name: t)
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
    end
  end
end
