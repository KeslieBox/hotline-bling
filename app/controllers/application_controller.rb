class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user
    helper_method :logged_in?
    helper_method :current_caller
    helper_method :current_call
    before_action :require_login
     
    
    def current_user
        Dispatcher.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def require_login
        redirect_to root_path unless logged_in?
    end 

    def current_caller
        @caller = Caller.find_by(id: params[:id])
        if !@caller
            redirect_to callers_path
        end
    end

    def current_call
        @call = Call.find_by(id: params[:id])
        if !@call
            redirect_to calls_path
        end
    end
end
