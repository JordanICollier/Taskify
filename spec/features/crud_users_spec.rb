require 'rails_helper'

describe 'Signing up/in/out as user' do

  before :each do
    #  visit "/"
    #  click_on 'Sign Up'
    #  fill_in "First name", with: 'John'
    #  fill_in "Last name", with: 'Doe'
    #  fill_in "Email", with: 'j@gmail.com'
    #  fill_in "Password", with: 'password'
    #  fill_in "Password confirmation", with: 'password'
    #  click_button "Sign Up"
    #  expect(page).to have_content 'User was successfully created.'
    #  click_on "Sign Out"
  end

  it "can create a user" do
    visit "/"
    click_on 'Sign Up'
    fill_in "First name", with: 'John'
    fill_in "Last name", with: 'Doe'
    fill_in "Email", with: 'j@gmail.com'
    fill_in "Password", with: 'password'
    fill_in "Password confirmation", with: 'password'
    click_button "Sign Up"
    expect(page).to have_content 'User was successfully created.'
  end

  it "can sign in as a user" do
    visit "/"
    click_on 'Sign Up'
    fill_in "First name", with: 'John'
    fill_in "Last name", with: 'Doe'
    fill_in "Email", with: 'j@gmail.com'
    fill_in "Password", with: 'password'
    fill_in "Password confirmation", with: 'password'
    click_button "Sign Up"
    expect(page).to have_content 'User was successfully created.'
    click_on "Sign Out"

    visit "/login"
    click_on 'Sign In'
    fill_in "Email", with: 'j@gmail.com'
    fill_in "Password", with: 'password'
    click_button "Login!"
    expect(page).to have_content 'Welcome back, stranger!'
  end
  it "can sign out as a user" do
    visit "/"
    click_on 'Sign Up'
    fill_in "First name", with: 'John'
    fill_in "Last name", with: 'Doe'
    fill_in "Email", with: 'j@gmail.com'
    fill_in "Password", with: 'password'
    fill_in "Password confirmation", with: 'password'
    click_button "Sign Up"
    expect(page).to have_content 'User was successfully created.'
    click_on "Sign Out"
  end
end
