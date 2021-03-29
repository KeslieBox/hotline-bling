class Call < ApplicationRecord
    belongs_to :dispatcher
    belongs_to :caller
    validates_presence_of :caller_id, :dispatcher_id, :dispatch_log

    
    def caller_attributes=(caller_attributes)
        if !caller_attributes[:first_name].empty?
            self.caller = Caller.find_or_create_by(first_name: caller_attributes[:first_name], last_name: caller_attributes[:last_name]) do |caller|
                caller.update(caller_attributes)
            end
        end
    end  
end
