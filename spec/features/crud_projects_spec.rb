require 'rails_helper'

describe 'Users can CRUD tasks' do

 before :each do

    User.create(first_name: "Jordan", last_name: "Collier", email: "jordanicollier@gmail.com", password: "password", role: 1)
    visit "/"
    click_on 'Sign In'
    fill_in "Email", with: 'jordanicollier@gmail.com'
    fill_in "Password", with: 'password'
    click_on "Login!"

   Project.create(name: "test project")
    visit "/projects"
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

 it "can delete a project" do
  click_on "Destroy"
  expect(page).to have_content 'Project was successfully deleted.'
 end

end
