# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

State.create([{:name=>"Alaska"}, {:name=>"Alabama"}, {:name=>"Arkansas"}, {:name=>"Arizona"}, {:name=>"California"}, {:name=>"Colorado"}, {:name=>"Connecticut"}, {:name=>"District of Columbia"}, {:name=>"Delaware"}, {:name=>"Florida"}, {:name=>"Georgia"}, {:name=>"Hawaii"}, {:name=>"Iowa"}, {:name=>"Idaho"}, {:name=>"Illinois"}, {:name=>"Indiana"}, {:name=>"Kansas"}, {:name=>"Kentucky"}, {:name=>"Louisiana"}, {:name=>"Massachusetts"}, {:name=>"Maryland"}, {:name=>"Maine"}, {:name=>"Michigan"}, {:name=>"Minnesota"}, {:name=>"Missouri"}, {:name=>"Mississippi"}, {:name=>"Montana"}, {:name=>"North Carolina"}, {:name=>"North Dakota"}, {:name=>"Nebraska"}, {:name=>"New Hampshire"}, {:name=>"New Jersey"}, {:name=>"New Mexico"}, {:name=>"Nevada"}, {:name=>"New York"}, {:name=>"Ohio"}, {:name=>"Oklahoma"}, {:name=>"Oregon"}, {:name=>"Pennsylvania"}, {:name=>"Rhode Island"}, {:name=>"South Carolina"}, {:name=>"South Dakota"}, {:name=>"Tennessee"}, {:name=>"Texas"}, {:name=>"Utah"}, {:name=>"Virginia"}, {:name=>"Vermont"}, {:name=>"Washington"}, {:name=>"Wisconsin"}, {:name=>"West Virginia"}, {:name=>"Wyoming"}])

Parish.create([{name: "Orleans"}, {name: "Jefferson"}])

Dispatcher.create([{username: "user1", password: "password"}, {username: "user2", password: "password"}, {username: "user3", password: "password"}])

Caller.create([{first_name: "Joe", last_name: "Johns", address: "222 Strawberry Ln.", city: "New Orleans", state_id: 274, parish_id: 9, zipcode: '70119', phone_number: '5045555555'}, {first_name: "Ricky", last_name: "Ramirez", address: "1015 Strawberry Ln.", city: "New Orleans", state_id: 274, parish_id: 10, zipcode: '70119', phone_number: '5045555957'}, {first_name: "Janet", last_name: "Jackson", address: "100 Esplanade Ave", city: "New Orleans", state_id: 274, parish_id: 9, zipcode: '70117', phone_number: '5045559087'}])

Call.create([{ date: "03/27/2021", dispatch_log: "log of what happened today", dispatcher_id: 10, caller_id: 4}, { date: "03/21/2021", dispatch_log: "log of what happened today", dispatcher_id: 10, caller_id: 5}, { date: "04/15/2020", dispatch_log: "log of what happened today", dispatcher_id: 10, caller_id: 6} ])



