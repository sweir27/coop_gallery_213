class Admin::SitesController < Admin::BaseController
  before_action :require_admin

  def index
    @site = Site.first
  end

  def edit
    # This model is silly as we really only care about the first one.
    @site = Site.first
  end

  def update
    @site = Site.first
    if @site.update_attributes(site_params)
      flash[:success] = "Site updated"
      redirect_to admin_sites_path
    else
      render 'edit'
    end
  end

  private

  def site_params
    params.require(:site).permit(:home_image, :about_image, :exhibiting_member_pdf, :supporting_member_pdf)
  end
end
