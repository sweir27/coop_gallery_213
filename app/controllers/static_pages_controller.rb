class StaticPagesController < ApplicationController
  before_action :signed_in_user, only: [:calendar]

  def contact; end

  def about
    @site = Site.first
  end

  def calendar; end

  private

  def signed_in_user
    store_location
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end
end
