class ArtworksController < ApplicationController
  def show
    @artist = User.find(params[:artist_id])
    @artwork = @artist.artworks.find(params[:id])
    @artworks = @artist.artworks
  end
end
