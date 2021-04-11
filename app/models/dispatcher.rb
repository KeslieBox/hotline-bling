class Dispatcher < ApplicationRecord
    has_many :calls
    has_many :callers, through: :calls
    has_secure_password
    validates :username, presence: true, uniqueness: true

    scope :top_dispatch, -> {self.joins(:calls).group('dispatchers.id').order('count(calls.id) DESC')}

end
