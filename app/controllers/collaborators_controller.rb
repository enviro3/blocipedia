class CollaboratorsController < ApplicationController

  def create
    puts "MADE IT HERE==========================================================="
    puts params[:collaborator]
    puts params[:wiki]
    puts params
    user_id = params[:user_ID]
    wiki_id = params[:wiki_id]

    @collaborator = Collaborator.new(user_id: user_id, wiki_id: wiki_id)

    # find collab with params[:collaborator]
    # @collaborator = Collaborator.find(params[:collaborator])

    # find wiki with params[:wiki_id]
    @wiki = Wiki.find(params[:wiki_id])

    if @collaborator.save
      flash[:notice] = "Collaborator was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the collaborator. Please try again."
      render :new
    end

  end


  def destroy
    # find collaborator    THIS IS WRONG FIX IT!!!!
    @collaborator = Collaborator.find(params[:collaborator])

    # delete collaborator
    if @collaborator.destroy
      flash[:notice] = "\"#{@collaborator}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the collaborator."
      render :show
    end

    # redirect
    redirect_to @wiki
  end
end
