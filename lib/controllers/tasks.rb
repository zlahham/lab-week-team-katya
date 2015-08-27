require_relative './base.rb'

module VirtualAssistant
  module Routes
    class TasksController < Base

      get '/tasks/new' do
        haml :'tasks/new'
      end

      delete '/tasks' do
        task_id = params[:id]
        task_delete = Task.first(task_id)
        p task_delete
        task_delete.destroy
        redirect '/'
      end

      # delete '/sessions' do
      #   session.clear
      #   flash[:notice] = 'You are now logged out'
      # end

    end
  end
end
