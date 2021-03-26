class SessionsController < ApplicationController
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
        redirect_to '/login'
    end
end