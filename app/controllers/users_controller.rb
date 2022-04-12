# frozen_string_literal: true

# Controls showing the User page
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
end
