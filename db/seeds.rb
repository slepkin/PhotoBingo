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

User.create({:name => "guest", :email => "guest@guest.com",
  :password => "password", :password_confirmation => "password"})

Theme.create({:name => "Cats", :user_id => 1,
  :phrases_attributes =>
    {
      "0"=>{:body=>"happy cat"},
      "1"=>{:body=>"sad cat"},
      "2"=>{:body=>"running cat"},
      "3"=>{:body=>"sleeping cat"},
      "4"=>{:body=>"scared-y cat"},
      "5"=>{:body=>"box of cats"},
      "6"=>{:body=>"cat in hat"},
      "7"=>{:body=>"cat in clothing"},
      "8"=>{:body=>"cat meets dog"},
      "9"=>{:body=>"cat meets tiny animal"},
      "10"=>{:body=>"cat is vicious hunter"},
      "11"=>{:body=>"hairless cat"},
      "12"=>{:body=>"wet cat"},
      "13"=>{:body=>"cat wreaking destruction"},
      "14"=>{:body=>"cat scratching something"},
      "15"=>{:body=>"kittens are confused"}
    }
  }
)