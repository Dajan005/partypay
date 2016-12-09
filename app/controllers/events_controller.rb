
require 'open-uri'
require 'json'


class EventsController < ApplicationController
  def index
    @events = Event.all

    render("events/index.html.erb")
  end

  def show
    @event = Event.find(params[:id])
    @item= Item.new

    if @event.location != ""

              @lat=@event.lat
              @long=@event.long
            end


    render("events/show.html.erb")
  end

  def new
    @event = Event.new

    render("events/new.html.erb")
  end

  def create
    @event = Event.new

    @event.title = params[:title]
    @event.location = params[:location]


    if @event.location != ""
          @street_address_without_spaces = URI.encode(@event.location)

            url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@street_address_without_spaces}"

            raw_data = open(url).read
            parsed_data = JSON.parse(raw_data)
                  @results = parsed_data["results"]

        if  parsed_data["results"][0]["address_components"][0]["long_name"].to_s + " " +parsed_data["results"][0]["address_components"][1].to_s
          @event.street = parsed_data["results"][0]["address_components"][0]["long_name"] + " " +parsed_data["results"][0]["address_components"][1]["long_name"]
        end

        if parsed_data["results"][0]["address_components"][3]
        @event.city = parsed_data["results"][0]["address_components"][3]["long_name"]
      end

      if parsed_data["results"][0]["address_components"][5]
        @event.state = parsed_data["results"][0]["address_components"][5]["long_name"]
      end

        if parsed_data["results"][0]["address_components"][7]
        @event.zip = parsed_data["results"][0]["address_components"][7]["long_name"]
      end

      if parsed_data["results"][0]["address_components"][2]
        @event.neighborhood = parsed_data["results"][0]["address_components"][2]["long_name"]
    end

          @event.lat = parsed_data["results"][0]["geometry"]["location"]["lat"]


          @event.long = parsed_data["results"][0]["geometry"]["location"]["lng"]


        end

    @event.description = params[:description]
    @event.date = params[:date]
    @event.receipt = params[:receipt]
    @event.user_id = params[:user_id]

    save_status = @event.save

    if save_status == true
      redirect_to("/events/#{@event.id}", :notice => "Event created successfully.")
    else
      render("events/new.html.erb")
    end
  end

  def edit
    @event = Event.find(params[:id])

    render("events/edit.html.erb")
  end

  def update
    @event = Event.find(params[:id])

    @event.title = params[:title]
    @event.location = params[:location]

    if @event.location != ""
          @street_address_without_spaces = URI.encode(@event.location)

            url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@street_address_without_spaces}"

            raw_data = open(url).read
            parsed_data = JSON.parse(raw_data)
                  @results = parsed_data["results"]

        if  parsed_data["results"][0]["address_components"][0]["long_name"].to_s + " " +parsed_data["results"][0]["address_components"][1].to_s
          @event.street = parsed_data["results"][0]["address_components"][0]["long_name"] + " " +parsed_data["results"][0]["address_components"][1]["long_name"]
        end

        if parsed_data["results"][0]["address_components"][3]
        @event.city = parsed_data["results"][0]["address_components"][3]["long_name"]
      end

      if parsed_data["results"][0]["address_components"][5]
        @event.state = parsed_data["results"][0]["address_components"][5]["long_name"]
      end

        if parsed_data["results"][0]["address_components"][7]
        @event.zip = parsed_data["results"][0]["address_components"][7]["long_name"]
      end

      if parsed_data["results"][0]["address_components"][2]
        @event.neighborhood = parsed_data["results"][0]["address_components"][2]["long_name"]
    end

          @event.lat = parsed_data["results"][0]["geometry"]["location"]["lat"]


          @event.long = parsed_data["results"][0]["geometry"]["location"]["lng"]


        end

    @event.description = params[:description]
    @event.date = params[:date]
    @event.receipt = params[:receipt]
    @event.user_id = params[:user_id]

    save_status = @event.save

    if save_status == true
      redirect_to("/events/#{@event.id}", :notice => "Event updated successfully.")
    else
      render("events/edit.html.erb")
    end
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy

    if URI(request.referer).path == "/events/#{@event.id}"
      redirect_to("/", :notice => "Event deleted.")
    else
      redirect_to(:back, :notice => "Event deleted.")
    end
  end
end
