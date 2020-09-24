class ItemsController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    User.create(user_params)
  end
end
