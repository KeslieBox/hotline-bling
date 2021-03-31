class CallersController < ApplicationController
    
    def index
        if params[:first_name]
          @callers = Caller.first_name_search(params[:first_name])
        else
          @callers = Caller.all
        end
      end
    
    def new
        @caller = Caller.new
    end 

    def create
        @caller = Caller.new(caller_params)
        if caller.save 
            redirect_to caller_path(@caller)
        else  
            @errors = @caller.errors.full_messages
            render :new
        end 
    end
    
    def show
        @caller = Caller.find_by(id: params[:id])
    end

    private 

    def caller_params
        params.require(:caller).permit(:date, :first_name, :last_name, :phone_number, :address, :city, :zipcode, :state_id, :parish_id)
    end  
end
