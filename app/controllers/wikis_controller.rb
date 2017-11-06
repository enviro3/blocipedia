class WikisController < ApplicationController
  include Pundit
  # after_action :verify_authorized, except: :index
  # after_action :verify_policy_scoped, only: :index

  before_action :require_sign_in, except: [:index, :show]
  before_action :authorize_user, except: [:index, :show]

  def authorize_user
    wiki = Wiki.find(params[:id])
    unless current_user.admin?
      flash[:alert] = "You must be an admin to do that."
      redirect_to wikis_path
    end
  end
  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]

    if @wiki.save
      flash[:notice] = "Wiki was saved."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def index
    @wikis = WikiPolicy::Scope.new(current_user, Wiki).resolve
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    if @wiki.save
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
    end
  end

  def new
    @wiki = Wiki.new
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

end
