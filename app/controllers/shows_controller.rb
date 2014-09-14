class ShowsController < ApplicationController
  def index
    @shows = Show.all
  end

  def new
    @show = Show.new
  end

  def create
    @show = Show.new(show_params)
    if @show.save
      flash[:success] = "New show created"
      redirect_to shows_path
    else
      render 'new'
    end
  end

   def destroy
    Show.find(params[:id]).destroy
    flash[:success] = "Show deleted."
    redirect_to shows_url
  end

  def current
    @current_show = Show.where(:current => true).first
  end

  def past
    current_show = Show.where(:current => true).first
    start_date = Show.arel_table[:start_date]
    @past_shows = Show.where(start_date.lt(current_show.start_date))
    render 'past'
  end

  def upcoming
    current_show = Show.where(:current => true).first
    end_date = Show.arel_table[:end_date]
    @upcoming_shows = Show.where(end_date.gt(current_show.end_date))
    render 'upcoming'
  end

  def set_current
    show = Show.find(params[:id])
    Show.update_all(:current => false)
    show.toggle!(:current)
    redirect_to shows_url
  end

  private
    def admin_user
      # store_location
      flash[:notice] = "Only administrators can create links" unless current_user && current_user.admin?
      redirect_to(root_url) unless current_user && current_user.admin?
    end

    def show_params
      params.require(:show).permit(:name, :description, :artists, :start_date, :end_date, :picture_1, :picture_2)
    end
end
