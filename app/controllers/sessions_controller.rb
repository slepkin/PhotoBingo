# class SessionsController < ApplicationController
#   before_filter :authenticate_user!, only: "destroy"
#
#   def new
#     @user = User.new
#   end
#
#   def create
#     @user = User.new(params[:user])
#     potential_user = User.find_by_name(@user.name)
#
#     if potential_user && potential_user.authenticate(@user.password)
#       login(potential_user)
#     else
#       flash.now[:alert] = "Invalid Username/Password"
#       render :new
#     end
#
#   end
#
#   def destroy
#     session[:token] = nil
#     render :new
#   end
# end