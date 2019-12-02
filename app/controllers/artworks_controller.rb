class ArtworksController < ApplicationController
  def show
    @artist = User.find(params[:artist_id])
    @artwork = @artist.artworks.find(params[:id])
    @artworks = @artist.artworks.with_attached_image
  end
end
