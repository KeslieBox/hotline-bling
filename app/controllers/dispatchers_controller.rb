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
            @errors = @dispatcher.errors.full_messages
            render :new
        end 
    end

    def show
        @callers = current_user.callers.uniq
    end

    def top_dispatcher
        @top_dispatcher = Dispatcher.top_dispatch
    end

    private

    def dispatcher_params
        params.require(:dispatcher).permit(:username, :password)
    end 
end
