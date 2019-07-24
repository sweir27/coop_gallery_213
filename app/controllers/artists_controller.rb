class ArtistsController < ApplicationController
  def index
    # add filter here in case not all users are technically artists
    @artists = User.all.order(:slug)
  end

  def show
    @artist = User.find(params[:id])
    @artworks = @artist.artworks.order(created_at: :asc)
  end
end
