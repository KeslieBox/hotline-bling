class CallersController < ApplicationController
    
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
        @caller = Caller.find_by(id: params[:id])
    end

    def edit
        @caller = Caller.find_by(id: params[:id])
        @callers = Caller.all
        @parishes = Parish.all
        @states = State.all
    end

    def update
        @caller = Caller.find_by(id: params[:id])
        @caller.update(caller_params)
        if @caller.save
            flash[:message] = "Succesfully updated caller!"
            redirect_to caller_path(@caller)
        else
            render :edit
        end
    end

    private 

    def caller_params
        params.require(:caller).permit(:date, :first_name, :last_name, :phone_number, :address, :city, :zipcode, :state_id, :parish_id)
    end  
end
