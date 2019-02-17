class Admin::AnnouncementsController < Admin::BaseController
  before_action :require_admin

  def index
    @announcements = Announcement.all
  end

  def new
    @announcement = Announcement.new
  end

  def create
    @announcement = Announcement.new(announcement_params)
    if @announcement.save
      flash[:success] = "New announcement created"
      redirect_to admin_announcements_path
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
      redirect_to admin_announcements_path
    else
      render 'edit'
    end
  end

  def destroy
    Announcement.find(params[:id]).destroy
    flash[:success] = "Announcement deleted."
    redirect_to admin_announcements_path
  end

  private

  def announcement_params
    params.require(:announcement).permit(:title, :description, :announcement_link, :announcement_image, :pdf, :pdf_title)
  end
end
