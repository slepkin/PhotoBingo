class VotesController < ApplicationController
  before_filter :authenticate_user!

  def create
    vote = Vote.new(params[:vote])
    unless vote.save
      flash[:alert] = vote.errors.full_messages.join("\n")
      redirect_to :back
    else
      #Go to next pending photo, else your board
      game = vote.game
      photos_needing_your_vote = game.pending_votes(current_user)

      if photos_needing_your_vote.blank?
        redirect_to board_url(current_user.boards.find_by_game_id(game.id))
      else
        redirect_to cell_url(photos_needing_your_vote.first.cell)
      end
    end
  end
end