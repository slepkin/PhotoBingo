require 'spec_helper'

describe Theme do
    before(:all) do
    user = User.create!(:name => "tester", :email => "tester@blah.com",
      :password => "password", :password_confirmation => "password")
  #Use Factory Girl for this

    theme = Theme.new(name: "test theme", user_id: user.id)
  end

  describe ".new" do

    it "makes a Theme" do
      theme.should be_a(Theme)
    end

    it "has given name" do
      theme.name.should eq("test theme")
    end
    it "belongs to author" do
      theme.user.should eq(user)
    end

  end

  describe "#save" do
    context "without name" do
      it "impossible" do
        theme.name = nil
        theme.save
        theme.errors.full_messages.should_not eq([])
      end
    end

    context "without user" do
      it "impossible without user" do
        theme.user = nil
        theme.save
        theme.errors.full_messages.should_not eq([])
      end
    end

    it "impossible without phrases" do
      theme.save
      theme.errors.full_messages.should_not eq([])
    end

    it "impossible with <16 phrases" do
      rand(15).times do
        theme.phrases.new(body: "I'm a body")
      end
      theme.save
      theme.errors.full_messages.should_not eq([])
    end

    it "works with 16 phrases" do
      16.times do
        theme.phrases.new(body: "I'm a body")
      end
      theme.save
      theme.errors.full_messages.should eq([])
    end

  end

end