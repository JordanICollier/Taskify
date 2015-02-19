require 'rails_helper'

describe 'Users can CRUD tasks' do

 before :each do
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

   @User = Project.create(name: "test project")
   visit "/projects"
   expect(page).to have_content 'test project'
 end

 it "can create a project" do
   click_on 'Create Project'
   expect(page).to have_content "Name"
   click_on "Create Project"
   expect(page).to have_content "prohibited this project from being saved:"
   fill_in "Name", with: 'turn it'
   click_button "Create Project"
   expect(page).to have_content 'Project was successfully created'
 end

 it "can edit a project" do
   click_on "Edit"
   fill_in "Name", with: "test it"
   click_on "Update Project"
   expect(page).to have_content 'Project was successfully updated.'
 end

 it 'can delete a user' do
   click_on 'Destroy'
   expect(page).to have_content 'Project was successfully deleted.'
 end
 # it 'can edit a user' do
 #   click_on 'Edit'
 #   click_on 'Update User'
 #   expect(page).to have_content 'User was successfully updated.'
 # end
 #
 # it 'can delete a user' do
 #   click_on 'Destroy'
 #   expect(page).to have_content 'User was successfully deleted.'
 # end


end
