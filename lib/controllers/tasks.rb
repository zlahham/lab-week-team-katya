require_relative './base.rb'

module VirtualAssistant
  module Routes
    class TasksController < Base

      get '/tasks/new' do
        haml :'tasks/new'
      end

      # delete '/sessions' do
      #   session.clear
      #   flash[:notice] = 'You are now logged out'
      # end

    end
  end
end
