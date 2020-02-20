class AttendancesController < ApplicationController
  before_action :admin?, only: [:index]

  def new
    @amount = (Event.find(params[:event_id]).price)*100
    @event = Event.find(params[:event_id])
  end

  def create
    # Amount in cents
    @amount = (Event.find(params[:event_id]).price)*100
    customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
    })
    charge = Stripe::Charge.create({
    customer: customer.id,
    amount: @amount,
    description: 'Rails Stripe customer',
    currency: 'eur',
    })
    @attendance = Attendance.new(event_id: params[:event_id], user_id: current_user.id, stripe_consumer_id: customer.id)
    if @attendance.save
      flash[:ok] = "Vous êtes bien isncrit à l'évenement!!!"
      redirect_to event_path(params[:event_id])# si ça marche, il redirige vers la page d'index du site
    else
      render new_event_attendance_path(params[:event_id])
    end
end

  def show
  end

  def index
    @attendances = Attendance.all 
    @event = Event.find(params[:event_id])
  end

  def edit
  end

  def update
  end

  def delete
  end

  private 

  def admin?
    if current_user.id != (Event.find(params[:event_id])).user_id
      render 'events/index'
    end
  end  

end
