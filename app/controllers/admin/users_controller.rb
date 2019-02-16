class Admin::UsersController < Admin::BaseController
  before_action :require_admin, except: [:show, :edit, :update]
  before_action :authorize_user, only: [:show, :edit, :update]

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
    redirect_to admin_users_url
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'admin_users_new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    scrubbed_params = user_params
    scrubbed_params.delete(:password) if scrubbed_params[:password].blank?
    scrubbed_params.delete(:password_confirmation) if scrubbed_params[:password_confirmation].blank?

    if @user.update_attributes(scrubbed_params)
      flash[:success] = "Profile updated"
      redirect_to [:admin, @user]
    else
      render 'edit'
    end
  end

  def toggle_admin
    user = User.find(params[:id])
    user.toggle!(:admin)
    redirect_to admin_users_url
  end

  def profile
    redirect_to admin_user_url(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :biography, :password, :password_confirmation, :pic, :website)
  end
end
