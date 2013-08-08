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
    {
      "0"=>{:body=>"gwehbt"},
      "1"=>{:body=>"heldfgslo"},
      "2"=>{:body=>"helhtryhrlo"},
      "3"=>{:body=>"bdf"},
      "4"=>{:body=>"ertjyt"},
      "5"=>{:body=>"hertb"},
      "6"=>{:body=>"w3g"},
      "7"=>{:body=>"jyrt"},
      "8"=>{:body=>"versbt"},
      "9"=>{:body=>"jyrj"},
      "10"=>{:body=>"hewerfllo"},
      "11"=>{:body=>"qwefafwe"},
      "12"=>{:body=>"juy6jr"},
      "13"=>{:body=>"greb"},
      "14"=>{:body=>"jytrj"},
      "15"=>{:body=>"vsdv"}
    }
  }
)