class Api::V1::UsersController < ApplicationController
  #CSRF Token Validations SKIP
  protect_from_forgery with: :null_session
  def login
    #Check if user is available
    user = User.find_by(user_name:params[:username])
    if not user.nil?
      render status:200, json:{message:"Login success",status:200,data:user}
    else
      render status:403, json:{message:"Login failure,User does not exist.",status:403}
    end
  end

  def register
    user = User.new(name:params[:name],user_name:params[:username])
    #Check if body is valid
    if user.valid?
      #If valid save the new User
      if user.save
        render status:201, json:{message:"User is registered successfuly.",data:user,status:201}
      else
        render status:500, json:{message:"Something went wrong please try again later.",status:500}
      end
    else
      render status:400, json:{message:"Bad request.",status:400}
    end
  end
end