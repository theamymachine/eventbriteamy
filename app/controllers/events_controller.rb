class EventsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new]
  before_action :admin?, only: [:edit]

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
    @event = Event.find(params[:id])
    if current_user 
  end
end

  def index
    @events = Event.all
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to event_path, 
      notice: "Votre profil a été mis à jour"
    else 
      render :new,
      notice: "Il y a une erreur, recommence"
    end
  end

  def destroy
    @event = Event.find(params[:id])
      if @event.destroy
        redirect_to events_path notice: "Evénement supprimé"
  
      else
        render :edit
        flash.alert = "Il y a un problème, recommence"
      end
  end
  
  private 

  def event_params
    params.require(:event).permit(:title, :user_id, :description, :location, :duration, :start_date, :price)
  end

  def admin?
    if current_user.id != (Event.find(params[:id])).user_id
      render 'events/index'
    end
  end 
end
