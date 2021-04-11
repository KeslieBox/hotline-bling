class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

   #how to make this work with life cycle/ callback
    def make_titlecase(attribute)
        self.send("#{attribute}=", self.send(attribute).titlecase)
    end
end
