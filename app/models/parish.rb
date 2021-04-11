class Parish < ApplicationRecord
    has_many :callers
    validates :name, presence: true, length: {minimum: 3}
end 