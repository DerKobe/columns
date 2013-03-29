class UsersController < ApplicationController

  def index
    if params[:key] == 'showmeallusers'
      @users = User.all.entries
    else
      @users = []
    end
  end

end