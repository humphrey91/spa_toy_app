class UsersController < ApplicationController
  

  def index
    @users = User.paginate(page: params[:page])
    if params[:search]
      @users = User.search(params[:search]).order(created_at: :desc).paginate(page: params[:page])
    end
    respond_to do |format|
      format.html
      format.js { render 'index' }
    end
  end

  def show
    @user = User.find(params[:id])
  end

end