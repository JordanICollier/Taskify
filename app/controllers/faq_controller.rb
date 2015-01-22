class FaqController < ApplicationController
  def index
    what = CommonQuestion.new
    what.question = "What is gCamp?"
    what.answer = "gCamp is an awesome tool that is going to change your life. gCamp is your one stop shop to organize all your tasks. You'll also be able to track comments that you and others make. gCamp may eventually replace all need for paper and pens in the entire world. Well, maybe not, but it's going to be pretty cool."
    what.slug = "what-is-gcamp"

    how = CommonQuestion.new
    how.question = "How do I join gCamp?"
    how.answer = "As soon as it's ready for the public, you'll see a signup link in the upper right. Once that's there, just click it and fill in the form!"
    how.slug = "how-do-i-join-gcamp"


    done = CommonQuestion.new
    done.question = "When will gCamp be finished?"
    done.answer = "gCamp is a work in progress. That being said, it should be fully functional in the next few weeks. Functional. Check in daily for new features and awesome functionality. It's going to blow your mind. Organization is just a click away. Amazing!"
    done.slug = "when-will-gcamp-be-finished"


    @faqs = [what, how, done]
  end
end
