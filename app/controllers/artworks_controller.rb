class ArtworksController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :destroy]
  # before_action :correct_user,   only: [:new, :create, :destroy]

  def create
    @artwork = current_user.artworks.build(artwork_params)
    if @artwork.save
      flash[:success] = "Artwork added"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def destroy
    Artwork.find(params[:id]).destroy
    flash[:success] = "Artwork deleted."
    redirect_to current_user
  end

  def new
    @artwork = Artwork.new
  end

  def edit
    @artwork = Artwork.find(params[:id])
  end

  def update
    @artwork = Artwork.find(params[:id])
    if @artwork.update_attributes(artwork_params)
      flash[:success] = "Artwork updated"
      redirect_to user_path(@artwork.user_id)
    else
      render 'edit'
    end
  end

  private
    def artwork_params
      params.require(:artwork).permit(:title, :image)
    end

    def signed_in_user
      store_location
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end

end
