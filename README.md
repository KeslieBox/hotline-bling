# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


NOTES

Application Flow

User 

1. signs up or
2. logs in
3. directed to organization homepage w/ links to: 
    -logout, 
    -go to their own profile(show)?which has 
        -their profile info & 
        -link to a list of links to their calls/ dispatch_logs by date), 
    -go to full index of dispatch logs, 
    -go to caller "address book"/database
    -create a new dispatch 
    -add a new caller to address book
4. 

##Team??
has_many :dispatchers
has_many :callers, through: :dispatchers
has_many :calls 


Caller
has_many_calls
has_many_dispatchers, through: :calls

name:string
phone_number:string
address: string
city:string
state:string
zip:string

Dispatcher(is the user right?)
has_many :calls
has_many :callers, through: :calls
has_secure_password

username:string
password:password_digest


Call
belongs_to :dispatcher
belongs_to :caller

date:datetime? or just grab from dispatch_log
dispatcher_id:belongs_to
caller_id:belongs_to
dispatch_log:text




don't think i need, alternative set up

Dispatch Log
belongs_to :dispatcher
has_one :call

date:datetime
content:text
dispatcher_id:belongs_to


Call
belongs_to :dispatcher
belongs_to :caller
belongs_to :dispatch_log

date:datetime? or just grab from dispatch_log
dispatcher_id:belongs_to
caller_id:belongs_to
dispatch_log_id?



Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
- [ ] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
    Resources for scope method:
    -https://apidock.com/rails/ActiveRecord/NamedScope/ClassMethods/scope
    -https://github.com/Awilmerding1/rails-pantry-011121/blob/rails-omniauth/app/models/measurement.rb
        -scope(:quantity_search, ->(quantity) { self.where("quantity >= ?", quantity) })
- [x] Include signup
- [x] Include login
- [x] Include logout
- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [ ] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [ ] Views use partials if appropriate
