require 'spec_helper'

describe Game do
  before(:all) do
    user = User.create!(:name => "tester", :email => "tester2@blah.com",
  :password => "password", :password_confirmation => "password")
  #Use Factory Girl for this

    theme = Theme.new(name: "test theme2", user_id: user.id)
    16.times do
      theme.phrases.new(body: random_string)
    end
    theme.save

    game = Game.new(theme_id: theme.id)
  end

  describe ".new" do
    it "cannot be saved without multiple players" do
      game.save
      game.errors.full_messages.should_not eq([])
    end

    it "can be saved with multiple players" do
      game.users = User.all
      game.save
      game.errors.full_messages.should eq([])
    end
  end

  describe "#new_notifications?" do
    before(:all) do
      game = Game.new(theme_id: theme.id)
      game.users = User.all
      game.save
    end

    it "is false when no notifications" do
      expect(game.new_notifications?(user)).to be_false
    end

    it "is true if any notifications are new" do
      Notification.create!(game_id: game.id, subject_id: user.id, quality: "win")
      expect(game.new_notifications?(user)).to be_true
    end

    it "is false when notifications exist but aren't new" do
      Visit.create!(user_id: user.id, game_id: game.id)
      expect(game.new_notifications?(user)).to be_false
    end

  end

end