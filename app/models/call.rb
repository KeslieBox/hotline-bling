class Call < ApplicationRecord
    belongs_to :dispatcher
    belongs_to :caller
    validates_presence_of :caller_id, :dispatcher_id, :dispatch_log

    def caller_attributes=(caller_attributes)
        if !caller_attributes[:first_name].empty? 
            self.caller = Caller.find_by(phone_number: caller_attributes[:phone_number]) || Caller.find_by(first_name: caller_attributes[:first_name], last_name: caller_attributes[:last_name])
            # self.caller = Caller.find_by(phone_number: caller_attributes[:phone_number]) 
            if self.caller
                self.caller.update(caller_attributes)
            else
                self.caller = Caller.create(caller_attributes)
            end
        end
    end 
    
end
