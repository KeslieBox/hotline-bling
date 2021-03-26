class Caller < ApplicationRecord
    has_many :calls
    has_many :dispatchers, through: :calls

end
