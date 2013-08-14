require 'spec_helper'

describe Theme do
  user = User.create!(:name => "simon", :email => "blah@blah.com",
:password => "password", :password_confirmation => "password")
#Use Factory Girl for this

  theme = Theme.new(name: "test theme", user_id: user.id)

  it "makes a Theme" do
    theme.should be_a(Theme)
  end

  it "has given name" do
    theme.name.should eq("test theme")
  end
  it "belongs to author" do
    theme.user.should eq(user)
  end

  it "cannot save without phrases" do
    theme.save.should be_false
  end

  it "cannot save with <16 phrases" do
    rand(15).times do
      theme.phrases.new(body: "I'm a body")
    end
    theme.save.should be_false
  end

  it "can save with 16 phrases" do
    16.times do
      theme.phrases.new(body: "I'm a body")
    end
    theme.save.should be_true
  end

end