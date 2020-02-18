class EventsController < ApplicationController
  def new
    @event = Event.new
  end
  def create
    @event = Event.new(title: params[:title], user_id: current_user.id , description: params[:description], location: params[:location], duration: params[:duration], start_date: params[:start_date], price: params[:price])
    if @event.save
     redirect_to events_path, notice: "Tu as créé un évènement."
   else
     render :new
     flash.alert = "Il y a un problème, recommence"
   end
  end

  def show
  end

  def index
    @events = Event.all
  end

  def edit
  end

  def update
  end

  def delete
  end
  
end
