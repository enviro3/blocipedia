class WikisController < ApplicationController
  def create
    @Wiki = Wiki.find(params[:post_id])
  end

  def read
  end

  def update
  end

  def delete
  end
end
