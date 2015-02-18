require 'rails_helper'

describe 'Users should be able to crud tasks' do

  before :each do
    visit '/tasks'
    expect(page).to have_content "Due on"

    #  howard = Student.create!(name: 'Howard', email: 'howard@muffins.com', password: 'password')
    #  aca_elite = Club.create!(name: 'Aca-Elite')
    #  jazz_hands = Club.create!(name: 'Jazz Hands')
    #  Participation.create!(student: howard, club: aca_elite, leader: false)
    #  visit "/login"
    #  fill_in "Email", with: "howard@muffins.com"
    #  fill_in "Password", with: "password"
    #  click_button "Login!"
    #  expect(page).to have_content "stranger"
    it "can create a task"
    click_button "New Task"
    expect(page).to have_content "Description"
    fill_in "Description", with: "build stuff"
    click_button "Create Task"
    expect(page).to have_content "build stuff"  
  end

  #  it "can creat a task" do
  #   #  click_on "My Clubs"
  #   #  expect(page).to have_content "Aca-Elite"
  #  end
  #
  #  it "see 403 for club don't participate in" do
  #    # aca_elite = Club.create!(name: 'Aca-Elite')
  #    # jazz_hands = Club.create!(name: 'Jazz Hands')
  #    # visit '/clubs/1'
  #    # expect(page).to have_content "aca-access"
  #  end
  #
  # end

  # before :each do
  #   @my_team = Team.create(name: 'pizza and the woofers')
  #   visit "teams/#{@my_team.id}/players/new"
  # end
  #
  # it "successfully adds a player" do
  #   expect(page).to have_content @my_team.name
  # end
  #
  # it "adds a player with a name" do
  #   fill_in "Name", with: "Puggeroni"
  #   click_button "Create Player"
  #   expect(page).to have_content "Puggeroni"
end
