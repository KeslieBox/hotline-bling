# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Call.create([{ date: "03/27/2021", dispatch_log: "log of what happened today", dispatcher_id: 1, caller_id: 1}, { date: "03/21/2021", dispatch_log: "log of what happened today", dispatcher_id: 2, caller_id: 2}, { date: "04/15/2020", dispatch_log: "log of what happened today", dispatcher_id: 3, caller_id: 3} ])

Dispatcher.create([{username: "user1", password: "password"}, {username: "user2", password: "password"}, {username: "user3", password: "password"}])

Caller.create([{first_name: "Joe", last_name: "Johns", address: "222 Strawberry Ln.", city: "New Orleans", state: 'Louisiana', zipcode: '70119', phone_number: '504-555-5555'}, {first_name: "Ricky", last_name: "Ramirez", address: "1015 Strawberry Ln.", city: "New Orleans", state: 'Louisiana', zipcode: '70119', phone_number: '504-555-5857'}, {first_name: "Janet", last_name: "Jackson", address: "100 Esplanade Ave", city: "New Orleans", state: 'Louisiana', zipcode: '70117', phone_number: '504-555-9087'}])