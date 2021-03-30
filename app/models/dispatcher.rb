class Dispatcher < ApplicationRecord
    has_many :calls
    has_many :callers, through: :calls
    has_secure_password
    validates_uniqueness_of :username
    before_validation :titlecase_values
    

    def titlecase_values
        make_titlecase(:username)
    end
   
end
