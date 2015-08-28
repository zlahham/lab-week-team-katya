require_relative './base.rb'

module VirtualAssistant
  module Routes
    class IndexController < Base

      get '/' do
        if session[:user_id]
          @tasks = Task.all(:user_id => session[:user_id])
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
            tag = Tag.create(tag_name: t, user_id: user_id)
            @task.tags << tag
          end
         @task.save
         redirect to('/')
        end
        # Make weather persist
      end

      get '/tags/:tag_name' do
        tag = Tag.all(tag_name: params[:tag_name],:user_id => session[:user_id])
        p tag
        @tasks = tag ? tag.tasks : []
        haml :index
      end

    end
  end
end
