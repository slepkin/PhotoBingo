# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create({:name => "simon", :email => "blah@blah.com",
  :password => "password", :password_confirmation => "password"})

User.create({:name => "bill", :email => "blah@blah.net",
  :password => "password", :password_confirmation => "password"})

Theme.create({:name => "Cats", :user_id => 1,
  :phrases_attributes =>
    {"1"=>{:body=>"hello"},
    "2"=>{:body=>"I am a cat"}}
    })