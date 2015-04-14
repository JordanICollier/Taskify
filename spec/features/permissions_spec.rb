require 'rails_helper'

describe "depending on the user, grants them certain permission" do

  before :each do
    User.create(first_name: "admin", last_name: "example", email: "admin@example.com", password: "password", role: 1)
    @user = User.create(first_name: "Jordan", last_name: "Collier", email: "jordanicollier@gmail.com", password: "password", role: 0)
    @project = Project.create(name: "Admin can see this")
    visit "/login"
    fill_in "Email", with: 'jordanicollier@gmail.com'
    fill_in "Password", with: 'password'
    click_on 'Login!'
    expect(page).to have_content 'Welcome back, stranger!'
  end

  it 'when a user logs in they are directed to the projects index page' do
    expect(page).to have_content 'Create Project'
  end

  it "allows user who have just signed up and logged in to be directed to the project creation page" do
    # click_on "Sign Out"
    visit "/registrations/new"
    click_on 'Sign Up'
    fill_in "First name", with: 'John'
    fill_in "Last name", with: 'Doe'
    fill_in "Email", with: 'j@gmail.com'
    fill_in "Password", with: 'password'
    fill_in "Password confirmation", with: 'password'
    click_button "Sign Up"
    expect(page).to have_content "Create Project"
  end

  it "takes a user to task index page when a project is created" do
    visit "/projects/new"
    fill_in "Name", with: "Test Project"
    click_on "Create Project"
    expect(page).to have_content "Project was successfully created"
    expect(page).to have_content "Tasks"
  end

  it "A user by default is made an owner of a project it creates" do
    visit "/projects/new"
    fill_in "Name", with: "Test Project"
    click_on "Create Project"
    first(:link, "Test Project").click
    click_on "1 Members"
    expect(page).to have_content 'You are the last owner'
  end

  it "can only view projects created" do
    @project = Project.create(name: 'Not mine')
       visit '/projects'
       expect(page).not_to have_content 'Not mine'
  end

  it "cannot view projects it is not a part of" do
    @project = Project.create(name: "Not mine")
    visit "/projects/#{@project.id}"
    expect(page).to have_content "You do not have access to that project"
  end

  it "can't access tasks that belong to other's projects" do
    @project = Project.create(name: "Not mine")
    visit project_tasks_path(@project)
    expect(page).to have_content 'You do not have access to that project'
  end

  it 'user restricted from memberships of projects it doesnt belong to' do
    @project = Project.create(name: 'Not mine')
    visit project_memberships_path(@project)
    expect(page).to have_content 'You do not have access to that project'
  end

  it 'only project owners can see edit button and delete well' do
    visit '/projects/new'
    fill_in 'Name', with: 'Test Project'
    click_button 'Create Project'
    first(:link, "Test Project").click
    expect(page).to have_css ".btn-info"
    click_on 'Edit'
    fill_in "Name", with: "Test Project"
    click_on "Update Project"
    expect(page).to have_content "Project was successfully updated."
    click_on "Delete"
    expect(page).to have_content  "Project was successfully deleted."
  end

  it "creator will see their own you are the last owner" do
    visit '/projects/new'
    fill_in 'Name', with: 'Test Project'
    click_button 'Create Project'
    visit '/projects'
    first(:link, 'Test Project').click
    click_on '1 Members'
    expect(page).to have_content 'You are the last owner'
  end

  it "user cannot create a user if they are not an admin" do
    visit '/users'
    expect(page).not_to have_content 'New User'
  end

  it "allows admin to view the new user button" do
    click_on "Sign Out"
    visit "/login"
    fill_in "Email", with: 'admin@example.com'
    fill_in "Password", with: 'password'
    click_on 'Login!'
    visit '/users'
    expect(page).to have_content 'New User'
  end

  it "user cannot see others emails" do
    visit '/users'
    expect(page).to_not have_content 'admin@example.com'
  end

  it "admins can see others emails" do
    click_on "Sign Out"
    visit "/login"
    fill_in "Email", with: 'admin@example.com'
    fill_in "Password", with: 'password'
    click_on 'Login!'
    visit '/users'
    expect(page).to have_content 'jordanicollier@gmail.com'
  end

  it "user cannot see other email on their showpage" do
    visit '/users'
    click_on "admin example"
    expect(page).to_not have_content 'admin@example.com'
  end

  it "admins can see others emails" do
    click_on "Sign Out"
    visit "/login"
    fill_in "Email", with: 'admin@example.com'
    fill_in "Password", with: 'password'
    click_on 'Login!'
    visit '/users'
    click_on "Jordan Collier"
    expect(page).to have_content 'Email:'
  end

  it "admins can see others make admin checkbox on their edit page" do
    click_on "Sign Out"
    visit "/login"
    fill_in "Email", with: 'admin@example.com'
    fill_in "Password", with: 'password'
    click_on 'Login!'
    visit '/users'
    first(:link, "Edit").click
    expect(page).to have_content 'Is admin'
  end

  it "users cannot see others make admin checkbox on their edit page" do
    click_on "Sign Out"
    visit "/login"
    fill_in "Email", with: 'jordanicollier@gmail.com'
    fill_in "Password", with: 'password'
    click_on 'Login!'
    visit '/users'
    click_on "Jordan Collier"
    expect(page).to_not have_content 'Is admin'
  end

  it "user cannot see all projects" do
    click_on "Sign Out"
    visit "/login"
    fill_in "Email", with: 'jordanicollier@gmail.com'
    fill_in "Password", with: 'password'
    click_on 'Login!'
    visit '/projects'
    expect(page).to_not have_content 'Admin can see this'
  end

  it "admin can see all projects" do
    click_on "Sign Out"
    visit "/login"
    fill_in "Email", with: 'admin@example.com'
    fill_in "Password", with: 'password'
    click_on 'Login!'
    visit '/projects'
    expect(page).to have_content 'Admin can see this'
  end
end
