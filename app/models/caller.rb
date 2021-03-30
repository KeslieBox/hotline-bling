class Caller < ApplicationRecord
    has_many :calls
    has_many :dispatchers, through: :calls  
    belongs_to :state
    belongs_to :parish  
    validates_uniqueness_of :phone_number
    # validates_length_of :phone_number is: 10
    validates :phone_number, :phone_number2, length: {is:10}
    validates_presence_of :first_name, :last_name, :phone_number
    # before_validation :titlecase_values
    # before_update :titlecase_values

    # def titlecase_values
    #     make_titlecase(:first_name)
    #     make_titlecase(:last_name)
    #     make_titlecase(:address)
    #     if self.city
    #         make_titlecase(:city)
    #     end
    #     if self.state
    #         make_titlecase(:state)
    #     end
    #     if self.parish
    #         binding.pry

    #         make_titlecase(:parish)
    #     end
    # end

    #make method to clean up titlecase for fields that are filled in
    # def field_present?

    # end

    def to_s
        "#{first_name} #{last_name}"
    end
end
