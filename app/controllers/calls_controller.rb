class CallsController < ApplicationController
    def index
        @calls = Call.all
    end

    def new
        @call = Call.new
        @call.build_caller
        @dispatchers = Dispatcher.all
        @callers = Caller.all
    end

    def create 
        @call = Call.new(call_params)
        #to get rid of hidden field??:
            @call.dispatcher = current_user
            #@call.caller = ...??
        if @call.save 
            redirect_to calls_path
        else 
            @dispatchers = Dispatcher.all
            @callers = Caller.all
            # @call.build_caller
            #how to prefill form with previous input when not all fields are filled in?
            @caller = Caller.find_by(first_name: params[:first_name])
            @errors = @call.errors.full_messages
            render :new
        end
    end

    def show
        @call = Call.find_by(id: params[:id])
    end 
    
    def edit 
        @call = Call.find_by(id: params[:id])
    end

    def update
        @call = Call.find_by(id: params[:id])
        @call.update(call_params)
        if @call.save
            redirect_to call_path(@call)
        else  
            @errors = @call.errors.full_messages
            render :edit
        end 
    end

    private 

    def call_params
        params.require(:call).permit(:date, :dispatcher_id, :caller_id, :dispatch_log, 
            caller_attributes: [
                :first_name, 
                :last_name, 
                :phone_number, 
                :address, 
                :city, 
                :state, 
                :zipcode
            ]
        )
        
    end  
end
