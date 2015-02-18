require 'rails_helper'

describe 'Users can CRUD tasks' do

 before :each do
   @User = User.create(first_name: 'Jordan', last_name: 'Collier', email: "jordanicollier@gmail.com")
   visit "/users"
   expect(page).to have_content 'Jordan'
 end

 it "can create a user" do
   click_on 'New User'
   fill_in "First name", with: 'John'
   fill_in "Last name", with: 'Doe'
   fill_in "Email", with: 'j@gmail.com'
   click_button "Create User"
   expect(page).to have_content 'User was successfully created.'
 end

 it 'can edit a user' do
   click_on 'Edit'
   click_on 'Update User'
   expect(page).to have_content 'User was successfully updated.'
 end

 it 'can delete a user' do
   click_on 'Destroy'
   expect(page).to have_content 'User was successfully deleted.'
 end


end
