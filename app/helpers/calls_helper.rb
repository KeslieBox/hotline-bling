module CallsHelper

    def city_autocomplete(callers) 
        callers.map do |caller|
            caller.city 
        end.uniq
    end

    
end
