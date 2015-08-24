require_relative './base.rb'

module VirtualAssistant
  module Routes
    class UserController < Base

      get '/users/new' do
        @user = User.new
        haml :'users/new'
      end

      post '/users' do
        @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation], name: params[:name])
      end

    end
  end
end
