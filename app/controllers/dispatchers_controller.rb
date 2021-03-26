class DispatchersController < ApplicationController
    def new
        @dispatcher = Dispatcher.new
    end

    def create
        dispatcher = Dispatcher.create(dispatcher_params)

        if dispatcher.save
            session[:user_id] = dispatcher.id 
            redirect_to dispatcher_path(dispatcher)
        else  
            render :new
        end 
    end

    def show
        @dispatcher = Dispatcher.find_by(id: params[:id])
    end 

    private

    def dispatcher_params
        params.require(:dispatcher).permit(:username, :password)
    end 
end
