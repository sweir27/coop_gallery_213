class Admin::LinksController < Admin::BaseController
  before_action :require_admin

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      flash[:success] = "New link created"
      redirect_to admin_links_path
    else
      render 'new'
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update_attributes(link_params)
      flash[:success] = "Link updated"
      redirect_to admin_links_path
    else
      render 'edit'
    end
  end

   def destroy
    Link.find(params[:id]).destroy
    flash[:success] = "Link deleted."
    redirect_to admin_links_url
  end

  private

  def link_params
    params.require(:link).permit(:title, :description, :url)
  end
end
