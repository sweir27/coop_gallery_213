class Admin::ArtworksController < Admin::BaseController
  before_action :authorize_user

  def create
    @user = User.find(params[:user_id])
    @artwork = @user.artworks.build(artwork_params)
    if @artwork.save
      flash[:success] = "Artwork added"
      redirect_to [:admin, @user]
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @user.artworks.find(params[:id]).destroy
    flash[:success] = "Artwork deleted."
    redirect_to admin_user_path(@user)
  end

  def new
    @user = User.find(params[:user_id])
    @artwork = Artwork.new
  end

  def edit
    @artwork = Artwork.find(params[:id])
  end

  def update
    @artwork = Artwork.find(params[:id])
    if @artwork.update_attributes(artwork_params)
      flash[:success] = "Artwork updated"
      redirect_to admin_user_path(@artwork.user_id)
    else
      render 'edit'
    end
  end

  def make_primary
    artwork = Artwork.find(params[:id])
    artist = artwork.user
    artist.update!(primary_artwork: artwork)
    redirect_to admin_user_path(artwork.user_id)
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image)
  end
end
