module CallsHelper

    #does this make sense??
    def form_url_helper(dispatcher)
        dispatcher ? dispatcher_call_path(dispatcher) : calls_path
    end
end
