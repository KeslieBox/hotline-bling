class Call < ApplicationRecord
    belongs_to :dispatcher
    belongs_to :caller
    validates_presence_of :caller_id, :dispatcher_id, :dispatch_log
    # accepts_nested_attributes_for :state
    # accepts_nested_attributes_for :parish
    # scope(:calls_by_caller, -> {group(:caller_id)})
    scope(:calls_by_caller, ->(first_name) { self.where("first_name == ?", first_name) })
    

    def caller_attributes=(caller_attributes)
        if !caller_attributes[:first_name].empty?
            self.caller = Caller.find_or_create_by(first_name: caller_attributes[:first_name], last_name: caller_attributes[:last_name], phone_number: caller_attributes[:phone_number]) do |caller|
                caller.update(caller_attributes)
            end
        end
    end 
    
end
