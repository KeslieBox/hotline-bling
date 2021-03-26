class Caller < ApplicationRecord
    has_many_calls
    has_many_dispatchers, through: :calls
    
end
