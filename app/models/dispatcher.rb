class Dispatcher < ApplicationRecord
    has_many :calls
    has_many :callers, through: :calls
    has_secure_password

    validates_uniqueness_of :username
end
