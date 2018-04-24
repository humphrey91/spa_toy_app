class UsersController < ApplicationController
  

  def index
    @users = User.paginate(page: params[:page])
    @user = current_user
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
    @microposts = @user.microposts.paginate(page: params[:page])
    respond_to do |format|
      format.js { render 'show' }
    end
  end

end