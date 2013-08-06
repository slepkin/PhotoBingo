# class UsersController < ApplicationController
#   def new
#     @user = User.new
#   end
#
#   def create
#     @user = User.new(params[:user])
#     if @user.save
#       login(@user)
#     else
#       flash.now[:alert] = "Passwords do not match"
#       render :new
#     end
#   end
# end