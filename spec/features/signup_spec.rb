require 'rails_helper'

describe "filling the form correctly allows the user to sign up" do

before :each do
  visit "/registrations/new"
end

it "valid user can sign up" do
   fill_in "First name", with: 'Test'
   fill_in "Last name", with: 'User'
   fill_in "Email", with: 'test@user.com'
   fill_in "Password", with: 'password'
   fill_in "Password confirmation", with: 'password'
   click_on 'Sign Up!'
   expect(page).to have_content 'User was successfully created.'
 end

 it "does not allow an invalid user to sign up" do
    click_on 'Sign Up!'
    expect(page).to have_content "Password can't be blank"
    expect(page).to have_content "First name can't be blank"
    expect(page).to have_content "Last name can't be blank"
    expect(page).to have_content "Email can't be blank"
  end


end
