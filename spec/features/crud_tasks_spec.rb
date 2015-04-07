require 'rails_helper'

describe 'Users can CRUD tasks' do

  before :each do

    User.create(first_name: "Jordan", last_name: "Collier", email: "jordanicollier@gmail.com", password: "password", role: 1)
    visit "/"
    click_on 'Sign In'
    fill_in "Email", with: 'jordanicollier@gmail.com'
    fill_in "Password", with: 'password'
    click_on "Login!"

    # Project.create(name: "test project")
    # visit "/projects"


    click_on "Projects"
    #  expect(page).to have_content "Task hard bro"
    #  click_button "Projects"
    click_on 'Create Project'
    expect(page).to have_content "Name"
    click_on "Create Project"
    expect(page).to have_content "prohibited this project from being saved:"
    fill_in "Name", with: 'turn it'
    click_button "Create Project"
    expect(page).to have_content 'Project was successfully created'

  end

  it "user can create task" do

    click_on 'New Task'
    expect(page).to have_content 'Description'
    fill_in "Description", with: 'Pass the test'
    click_button "Create Task"
    expect(page).to have_content 'Task was successfully created.'
  end

  it 'user can edit a task' do
    click_on 'New Task'
    expect(page).to have_content 'Description'
    fill_in "Description", with: 'Pass the test'
    click_button "Create Task"
    expect(page).to have_content 'Task was successfully created.'
    click_on 'Edit'
    click_on 'Update Task'
    expect(page).to have_content 'Task was successfully updated.'
  end

  it 'user can delete a task' do
    click_on 'New Task'
    expect(page).to have_content 'Description'
    fill_in "Description", with: 'Pass the test'
    click_button "Create Task"
    click_link("delete_link")
    expect(page).to have_content 'Task was successfully destroyed.'
  end

end
