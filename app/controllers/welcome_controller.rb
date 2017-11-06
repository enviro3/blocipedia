class WelcomeController < ApplicationController
  include Pundit
    #after_action :verify_authorized

  def index
  end

  def about
  end
end
