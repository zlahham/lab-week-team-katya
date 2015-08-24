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
            flash.now[:errors] = ['The email or password is incorrect']
            haml :'sessions/new'
          end
      end

      delete '/sessions' do
        session.clear
        flash[:notice] = 'You are now logged out'
      end

    end
  end
end
