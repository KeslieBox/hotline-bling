class Caller < ApplicationRecord
    has_many :calls
    has_many :dispatchers, through: :calls
    #can i do this??:
    # validates_uniqueness_of :to_s
    validates_length_of :phone_number, is: 10
    validates_presence_of :first_name, :last_name, :phone_number
    
    def to_s
        "#{first_name} #{last_name}"
    end
end
