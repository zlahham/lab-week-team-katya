require_relative './base.rb'

module VirtualAssistant
  module Routes
    class SessionController < Base

      get '/sessions/new' do
        haml :'sessions/new'
      end

      post'/sessions' do
        @user = User.authenticate(params[:email], params[:password])
          if @user
            session[:user_id] = @user.id
            redirect to('/')
            else
            flash.now[:error] = ['The username or password is incorrect']
              erb :'sessions/new'
            end
      end

    end
  end
end