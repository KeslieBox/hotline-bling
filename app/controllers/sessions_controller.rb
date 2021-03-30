class SessionsController < ApplicationController
    skip_before_action :require_login

    def new
        @errors = []
    end

    def create
        dispatcher = Dispatcher.find_by(username: params[:dispatcher][:username])
        if dispatcher && dispatcher.authenticate(params[:dispatcher][:password])
            session[:user_id] = dispatcher.id
            redirect_to dispatcher_path(dispatcher)
        elsif dispatcher
            @errors = ["Invalid Password"]
            render :new
        else  
            @errors = ["Invalid Username or password"]
            render :new
        end  
    end

    def destroy
        session.clear 
        redirect_to login_path
    end
end