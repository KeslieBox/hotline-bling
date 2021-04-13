class CallsController < ApplicationController
    before_action :current_call, except: [:index, :new, :create]

    def index
        @calls = Call.all
    end

    def new
        @call = Call.new
        @call.build_caller
        @callers = Caller.all
        @states = State.all
        @parishes = Parish.all
    end

    def create
        @call = Call.new(call_params)
        @call.dispatcher = current_user
    
        if @call.save 
            flash[:message] = "Call saved successfully!"
            redirect_to calls_path
        else
            @callers = Caller.all
            @call.build_caller(call_params[:caller_attributes])
            @states = State.all
            @parishes = Parish.all
            render :new
        end
    end 
    
    def edit 
        @caller = @call.caller
        @callers = Caller.all
        @states = State.all
        @parishes = Parish.all
        if @call.dispatcher != current_user
            flash[:message] = "You can only edit calls belonging to your username"
            redirect_to dispatcher_path(@call.dispatcher)
        end
    end

    def update
        @call.update(call_params)
        if @call.save
            flash[:message] = "Succesfully updated call!"
            redirect_to dispatcher_call_path(@call.dispatcher)
            # redirect_to call_path(@call)
        else  
            @caller = @call.caller
            @callers = Caller.all
            @states = State.all
            @parishes = Parish.all
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
                :phone_number2,
                :address, 
                :city, 
                :parish_name, 
                :state_id,
                :zipcode,
                :id
            ],

        )
        
    end  
end
