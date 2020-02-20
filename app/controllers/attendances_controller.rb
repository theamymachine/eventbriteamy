class AttendancesController < ApplicationController
  def new
    @amount = (Event.find(params[:event_id]).price)*100
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    @attendance = Attendance.new(event_id: @event.id, user_id: current_user.id)
    if @attendance.save
      redirect_to events_path, notice: "Vous participez à un évènement."
    else
      render :new
      flash.alert = "Il y a un problème, recommence"
    end
  end

  def show
  end

  def index
  end

  def edit
  end

  def update
  end

  def delete
  end

end
