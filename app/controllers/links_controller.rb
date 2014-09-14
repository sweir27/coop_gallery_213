class LinksController < ApplicationController
  before_action :admin_user, only: [:create, :new]

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
      redirect_to links_path
    else
      render 'new'
    end
  end

  private
    def admin_user
      # store_location
      flash[:notice] = "Only administrators can create links" unless current_user && current_user.admin?
      redirect_to(root_url) unless current_user && current_user.admin?
    end

    def link_params
      params.require(:link).permit(:title, :description, :url)
    end
end
