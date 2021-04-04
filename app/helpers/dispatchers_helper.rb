module DispatchersHelper
    def login_view
        params[:controller] == "sessions" 
    end
end
