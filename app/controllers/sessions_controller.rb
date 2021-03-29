class SessionsController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

    def new
        @dispatcher = Dispatcher.new
    end

    def create
        dispatcher = Dispatcher.find_by(username: params[:dispatcher][:username])
        if dispatcher
            session[:user_id] = dispatcher.id
            redirect_to dispatcher_path(dispatcher)
        else  
            render :new
        end  
    end

    def destroy
        session.delete :username
        redirect_to root_path
    end
end