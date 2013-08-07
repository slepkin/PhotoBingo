class VotesController < ApplicationController
  def create
    vote = Vote.new(params[:vote])
    unless vote.photo.pending_votes?(current_user) && vote.save
      flash[:alert] = "Invalid vote."
    end
    redirect_to :back
  end
end