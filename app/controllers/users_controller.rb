class UsersController < ApplicationController
  

  def index
    @user = current_user
    @microposts = Micropost.all.includes(:user).paginate(page: params[:index_page])
    @index = true
    if params[:search]
      @users = User.search(params[:search]).order(created_at: :desc).paginate(page: params[:page])
      @index = false
    end  
    respond_to do |format|
      format.html
      format.js { render 'index' }
    end
  end

  def show
    @user = User.find(params[:id])
    @user_microposts = Micropost.where(user_id: params[:id]).includes(:user).paginate(page: params[:user_page], :per_page => 5)
    respond_to do |format|
      format.js { render 'show' }
    end
  end

end