class CallersController < ApplicationController
    before_action :current_caller, except: :index
    
    def index
        if params[:first_name] 
            @callers = Caller.first_name_search(params[:first_name].capitalize.strip)
        # how to search for more than one thing?
        # elsif params[:last_name]
        #     @callers = Caller.last_name_search(params[:last_name])
        else
            @callers = Caller.all
        end
    end

    def show
        @dispatchers = @caller.dispatchers.uniq
    end

    def edit
        @callers = Caller.all
        @parishes = Parish.all
        @states = State.all
        if !@caller.dispatchers.include?(current_user)
            flash[:message] = "You can only edit contacts associated with your username"
            redirect_to caller_path(@caller)
        end
    end

    def update
        if @caller && @caller.update(caller_params)
            flash[:message] = "Succesfully updated caller!"
            redirect_to caller_path(@caller)
        elsif @caller
            @callers = Caller.all
            @parishes = Parish.all
            @states = State.all
            render :edit
        else
           redirect_to caller_path(@caller)
        end
    end

    private 

    def caller_params
        params.require(:caller).permit(:date, :first_name, :last_name, :phone_number, :address, :city, :zipcode, :state_id, :parish_id)
    end  
end
