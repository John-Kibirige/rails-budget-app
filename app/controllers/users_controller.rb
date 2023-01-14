class UsersController < ApplicationController
  def index
    return unless user_signed_in?

    redirect_to ctegories_path
  end
end
