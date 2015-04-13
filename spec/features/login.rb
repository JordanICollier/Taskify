require 'rails_helper'

describe 'filling in valid account information allows user to sign in' do

before :each do
  User.create(first_name: "Jordan", last_name: "Collier", email: "jordanicollier@gmail.com", password: "password", role: 1)
  visit "/login"
end

it "allows user to sign in" do
  fill_in "Email", with: 'Jordan'
  fill_in "Password", with: 'password'
  click_on 'Login!'
end

it "does not allow an invalid user to sign in" do
  click_on "Login!"
  expect(page).to have_content "Username / password combination is invalid"
end

end
