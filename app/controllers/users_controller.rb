class UsersController < ApplicationController
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user, only: [:destroy, :toggle_admin, :new]

  def new
    @user = User.new
  end

  def index
    @users = User.all.order(:slug)
  end

  def show
    @user = User.find(params[:id])
    @artworks = @user.artworks
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # sign_in @user
      # flash[:success] = "Welcome to the Cooperative Gallery"
      # redirect_to @user
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # authorize! :assign_roles, @user if params
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def toggle_admin
    user = User.find(params[:id])
    user.toggle!(:admin)
    redirect_to users_url
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :biography, :password, :password_confirmation, :pic, :website)
    end

    # Before filters

    def signed_in_user
      store_location
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      # store_location
      flash[:notice] = "Only administrators can create users" unless current_user && current_user.admin?
      redirect_to(root_url) unless current_user && current_user.admin?
    end
end
