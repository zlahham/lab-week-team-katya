require_relative './base.rb'

module VirtualAssistant
  module Routes
    class TasksController < Base

      get '/tasks/new' do
        haml :'tasks/new'
      end
<<<<<<< HEAD
=======

      delete '/tasks/:id' do
        task = Task.get(params[:id])
        task.tag_tasks.all.destroy
        task.destroy
        redirect '/'
      end

>>>>>>> 4d0b44cc7bee4ca7377c3575689fb8ebe226df86
    end
  end
end
