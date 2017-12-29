class CollaboratorsController < ApplicationController

  def create
    puts "MADE IT HERE"
    puts params[:collaborator]
    puts params[:wiki]

    @collaborator = Collaborator.new(user_id: collaborator_id, wiki_id: wiki.id)

    # find collab with params[:collaborator]
    @collaborator = Collaborator.find(params[:collaborator])

    # find wiki with params[:wiki_id]
    @wiki = Wiki.find(params[:id])

    if @collaborator.save
      flash[:notice] = "Collaborator was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the collaborator. Please try again."
      render :new
    end

    # make a new Collaborator with:
    # Collaborator.new(user_id: collab.id, wiki_id: wiki.id)
    # save, and redirect
  end


  def destroy
    # find collaborator
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
