class SessionsController < ApplicationController
    skip_before_action :require_login

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
        session.clear 
        redirect_to login_path
    end
end