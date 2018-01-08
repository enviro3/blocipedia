require 'pp'
class CollaboratorsController < ApplicationController

  def create
    puts "Made it here ======================================"
    pp params
    user_id = params[:collaborator][:user_id]
    wiki_id = params[:collaborator][:wiki_id]
    puts user_id
    collaborator = Collaborator.new(user_id: user_id, wiki_id: wiki_id)

    # find collab with params[:collaborator]
    # @collaborator = Collaborator.find(params[:collaborator])

    # find wiki with params[:wiki_id]
    @wiki = Wiki.find(wiki_id)

    if collaborator.save
      flash[:notice] = "The collaborator has been saved and now has access to this Wiki."
      redirect_to :back
    else
      flash.now[:alert] = "The collaborator has not been saved. Please try again."
      redirect_to :back
    end

  end


  def destroy

    collaborator = Collaborator.find(params[:id])

    if collaborator.destroy
      flash[:notice] = "The collaborator was deleted successfully."
      redirect_to :back
    else
      flash.now[:alert] = "There was an error removing the collaborator."
      redirect_to :back
    end

  end
end
