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
<<<<<<< HEAD
        haml :'sessions/delete'
=======
        redirect '/'
        # flash[:notice] = 'You are now logged out'
>>>>>>> 4d0b44cc7bee4ca7377c3575689fb8ebe226df86
      end

    end
  end
end
