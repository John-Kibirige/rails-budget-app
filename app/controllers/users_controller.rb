class UsersController < ApplicationController
  def index
    if user_signed_in?
      redirect_to ctegories_path
    end
  end
end
