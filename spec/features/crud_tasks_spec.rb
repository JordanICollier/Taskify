require 'rails_helper'

describe 'Users can CRUD tasks' do

  before :each do
    #  @task = Task.create(description: 'Task hard bro', due_date: '08-19-2015', complete: false)
    visit "/"
    click_on 'Sign Up'
    fill_in "First name", with: 'John'
    fill_in "Last name", with: 'Doe'
    fill_in "Email", with: 'j@gmail.com'
    fill_in "Password", with: 'password'
    fill_in "Password confirmation", with: 'password'
    click_button "Sign Up"


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
    click_on '0 Tasks'

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
    expect(page).to have_content 'Task was successfully created.'

    click_on 'Destroy'
    expect(page).to have_content 'Task was successfully destroyed.'
  end

end
