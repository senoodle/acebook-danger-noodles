require 'rails_helper'

RSpec.feature "User details", type: :feature do
  scenario "User username appears above post" do
    visit "/users/sign_up"
    fill_in "user_username", with: "Bob"
    fill_in "user_email", with: "bob@example.com"
    fill_in "user_password", with: "password1!"
    fill_in "user_password_confirmation", with: "password1!"
    click_button "Sign up"
    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    expect(page).to have_content("Bob")
  end

  scenario "user profile photo shows up on posts" do
    visit "/users/sign_up"
    fill_in "user_username", with: "Bob"
    fill_in "user_email", with: "bob@example.com"
    fill_in "user_password", with: "password1!"
    fill_in "user_password_confirmation", with: "password1!"
    # need to upload photo here
    attach_file("user[avatar]", './spec/files/zuckerberg.jpeg')
    click_button "Sign up"

    visit "/posts"
    click_link "New post"
    fill_in "Message", with: "Hello, world!"
    click_button "Submit"
    # expect page to have photo
    expect(page).to have_css("img[src*='zuckerberg.jpeg']")

  end


end