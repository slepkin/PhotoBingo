require 'spec_helper'

describe Game do
  user = User.create!(:name => "tester", :email => "tester2@blah.com",
:password => "password", :password_confirmation => "password")
#Use Factory Girl for this

  theme = Theme.new(name: "test theme2", user_id: user.id)
  16.times do
    theme.phrases.new(body: random_string)
  end
  theme.save

  game = Game.new(theme_id: theme.id)

  describe ".new" do
    it "has given theme name" do
      game.theme.should eq(theme)
    end

    it "cannot be saved without multiple players" do
      game.save.should be_false
    end
  end

end