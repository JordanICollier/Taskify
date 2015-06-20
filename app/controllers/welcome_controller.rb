class WelcomeController < ApplicationController
  def index
    @quotes = { 'Cayla Hayes': "Taskify has changed my life! It's the best tool I've ever used.",
              'Leta Jaskolski': "Before Taskify I was a disorderly slob. Now I'm more organized than I've   ever been.",
              'Lavern Upton': "Don't hesitate - sign up right now! You'll never be the same."}
  end


end
