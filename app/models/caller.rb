class Caller < ApplicationRecord
    has_many :calls, dependent: :destroy
    has_many :dispatchers, through: :calls  
    belongs_to :state
    belongs_to :parish  
    validates :phone_number, presence: true, length: {is: 10}
    validates_uniqueness_of :phone_number
    validates_presence_of :first_name, :last_name, :state_id, :parish_id
    before_validation :titlecase_values
    before_update :titlecase_values
    scope(:first_name_search, ->(first_name) { self.where("first_name == ?", first_name) })
    #not using yet:
    # scope(:last_name_search, ->(last_name) { self.where("last_name == ?", last_name) })


    def parish_name=(parish_name)
        self.parish = Parish.find_or_create_by(name: parish_name)
    end

    def parish_name
        if self.parish
            self.parish.name
        end
    end

    def titlecase_values
        if self.first_name || self.last_name || self.address || self.city || self.parish
            make_titlecase(:first_name)
            make_titlecase(:last_name)
            make_titlecase(:address)
            make_titlecase(:city)
            make_titlecase(:parish_name)
        end
    end

    def to_s
        "#{first_name} #{last_name}"
    end
end
