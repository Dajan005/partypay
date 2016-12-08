class MychargesController < ApplicationController

  def show
    @items = current_user.items.order(created_at: :desc)

    render("mycharges/show.html.erb")

  end

end
