require 'spec_helper'

feature "Adding tags" do
  before :each do
    sign_up_as_hello_world
  end

  it "has an add tag form on the post show page" do
    make_post
    page.should have_content 'Tag Name'
    page.should have_content 'Add Tag'
  end

  it "shows the post show page on submit" do
    make_post
    fill_in 'Tag Name', with: 'taggerific'
    click_button 'Add Tag'
    page.should have_content 'hello_world'
  end

  it "adds the tag to the tag list on clicking the submit button" do
    make_post
    fill_in 'Tag Name', with: 'taggerific'
    click_button 'Add Tag'
    page.should have_content 'taggerific'
  end
end

feature "Deleting tags" do
  before :each do
    sign_up_as_hello_world
    make_post
    add_tag
  end

  it "displays a remove button next to each tag" do
    page.should have_button 'Remove Tag'
  end

  it "shows the post show page on click" do
    click_button 'Remove Tag'
    page.should have_content 'hello_world'
  end

  it "removes the tag on click" do
    click_button 'Remove Tag'
    page.should_not have_content 'taggerific'
  end
end
