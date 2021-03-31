class Dispatcher < ApplicationRecord
    has_many :calls
    has_many :callers, through: :calls
    has_secure_password
    validates :username, presence: true, uniqueness: true

end
