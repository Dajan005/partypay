class MyeventsController < ApplicationController

  def show
    @events = current_user.events.order(created_at: :desc)

    render("myevents/show.html.erb")

  end

end
