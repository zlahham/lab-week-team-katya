require_relative './base.rb'

module VirtualAssistant
  module Routes
    class TasksController < Base

      get '/tasks/new' do
        haml :'tasks/new'
      end
    end
  end
end
