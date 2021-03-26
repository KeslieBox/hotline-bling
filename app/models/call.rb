class Call < ApplicationRecord
    belongs_to :dispatcher
    belongs_to :caller
end
