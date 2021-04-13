class DispatchersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]

    def index
        @dispatchers = Dispatcher.all
    end

    def new
        @dispatcher = Dispatcher.new
    end

    def create
        @dispatcher = Dispatcher.new(dispatcher_params)

        if @dispatcher.save
            session[:user_id] = @dispatcher.id 
            redirect_to dispatcher_path(@dispatcher)
        else  
            render :new
        end 
    end

    def show
        #need to fix... 
        if params[:id].to_i != current_user.id
            redirect_to dispatcher_path(current_user) 
        else
            @callers = current_user.callers.uniq
        end
    end

    def top_dispatcher
        @top_dispatcher = Dispatcher.top_dispatch
    end

    private

    def dispatcher_params
        params.require(:dispatcher).permit(:username, :password)
    end 
end
