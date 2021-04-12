class CallsController < ApplicationController
    
    def index
        @calls = Call.all
    end

    def new
        @call = Call.new
        @call.build_caller
        # @dispatchers = Dispatcher.all
        @callers = Caller.all
        @states = State.all
        @parishes = Parish.all
    end

    def create
        @call = Call.new(call_params)
    
        if @call.save 
            flash[:message] = "Call saved successfully!"
            redirect_to calls_path
        else
            # @dispatchers = Dispatcher.all
            @callers = Caller.all
            @call.build_caller(call_params[:caller_attributes])
            @states = State.all
            @parishes = Parish.all
            render :new
        end
    end

    def show
        @call = Call.find_by(id: params[:id])
    end 
    
    def edit 

        @call = Call.find_by(id: params[:id])
        @caller = @call.caller
        # @dispatchers = Dispatcher.all
        @callers = Caller.all
        @states = State.all
        @parishes = Parish.all
        if @call.dispatcher != current_user
            flash[:message] = "You can only edit calls belonging to your username"
            redirect_to dispatcher_path(@call.dispatcher)
        end
    end

    def update
        @call = Call.find_by(id: params[:id])
        @call.update(call_params)
        if @call.save
            flash[:message] = "Succesfully updated"
            redirect_to dispatcher_call_path(@call.dispatcher)
        else  
            @call = Call.find_by(id: params[:id])
            @caller = @call.caller
            # @dispatchers = Dispatcher.all
            @callers = Caller.all
            @states = State.all
            @parishes = Parish.all
            # if @call.dispatcher != current_user
            #     flash[:message] = "You can only edit calls belonging to your username"
            #     redirect_to dispatcher_path(@call.dispatcher)
            # end
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
