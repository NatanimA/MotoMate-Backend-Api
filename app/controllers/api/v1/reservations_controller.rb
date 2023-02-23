class Api::V1::ReservationsController < ApplicationController
  #CSRF Token Validations SKIP
  protect_from_forgery with: :null_session
  def reserve
    #Create an instance of reservation
    reservation = Reservation.new(city:params[:city],start_date:params[:start_date],
      end_date:params[:end_date],user_id:params[:user_id],motorcycle_id:params[:motorcycle_id])
    #Check for validation
    if not reservation.valid?
      render status:400, json:{message:"Bad request.",status:400}
    else
      #If it is valid save
      if reservation.save
        render status:201, json:{message:"Reservation made successfully.",data:reservation,status:201}
      else
        render status:500, json:{message:"Something went wrong please try again later.",status:500}
      end
    end
  end

  def checkout
    #Check for availablity
    reservation = Reservation.find_by(id:params[:id])
    if reservation.nil?
      render status:404,json:{message:"Reservation could not be found.",status:404}
    else
      #If Available destroy
      if reservation.destroy
        render status:200, json:{message:"Reservation have been removed",status:200}
      else
        render status:500, jsom:{message:"Something went wrong please try again later.",status:500}
      end
    end
  end

end
