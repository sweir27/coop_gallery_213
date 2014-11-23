class AnnouncementsController < ApplicationController
  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_params)
    if @announcement.save
      flash[:success] = "New announcement created"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @announcement = Announcement.find(params[:id])
  end

  def update
    @announcement = Announcement.find(params[:id])
    if @announcement.update_attributes(announcement_params)
      flash[:success] = "Announcement updated!"
      redirect_to root_url
    else
      render 'edit'
    end
  end

  def destroy
    Announcement.find(params[:id]).destroy
    flash[:success] = "Announcement deleted."
    redirect_to root_url
  end

  private
    def admin_user
      # store_location
      flash[:notice] = "Only administrators can create announcements" unless current_user && current_user.admin?
      redirect_to(root_url) unless current_user && current_user.admin?
    end

    def announcement_params
      params.require(:announcement).permit(:title, :description, :announcement_link, :announcement_image)
    end
end
