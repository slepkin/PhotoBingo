class VotesController < ApplicationController
  def create
    vote = Vote.new(params[:vote])
    unless vote.save
      flash[:alert] = vote.errors.full_messages.join("\n")
    end
    redirect_to :back
  end
end