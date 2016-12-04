class CountsController < ApplicationController
  def index
    @counts = Count.all

    render("counts/index.html.erb")
  end

  def show
    @count = Count.find(params[:id])

    render("counts/show.html.erb")
  end

  def new
    @count = Count.new

    render("counts/new.html.erb")
  end

  def create
    @count = Count.new

    @count.user_id = params[:user_id]
    @count.item_id = params[:item_id]

    save_status = @count.save

    if save_status == true
      redirect_to("/counts/#{@count.id}", :notice => "Count created successfully.")
    else
      render("counts/new.html.erb")
    end
  end

  def edit
    @count = Count.find(params[:id])

    render("counts/edit.html.erb")
  end

  def update
    @count = Count.find(params[:id])

    @count.user_id = params[:user_id]
    @count.item_id = params[:item_id]

    save_status = @count.save

    if save_status == true
      redirect_to("/counts/#{@count.id}", :notice => "Count updated successfully.")
    else
      render("counts/edit.html.erb")
    end
  end

  def destroy
    @count = Count.find(params[:id])

    @count.destroy

    if URI(request.referer).path == "/counts/#{@count.id}"
      redirect_to("/", :notice => "Count deleted.")
    else
      redirect_to(:back, :notice => "Count deleted.")
    end
  end
end
