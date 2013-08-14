class VotesController < ApplicationController
  def create
    vote = Vote.new(params[:vote])
    if vote.photo.pending_votes?(current_user)
      flash[:alert] = "You cannot submit a photo until you have voted on all pending photos!"
    elsif !vote.save
      flash[:alert] = vote.errors.full_messages.join("\n")
    end
    redirect_to :back
  end
end