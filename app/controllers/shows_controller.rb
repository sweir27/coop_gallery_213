class ShowsController < ApplicationController
  def index
    @shows = Show.all
    @is_current_page = false
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

  def edit
    @show = Show.find(params[:id])
  end

  def update
    @show = Show.find(params[:id])
    if @show.update_attributes(show_params)
      flash[:success] = "Show updated"
      redirect_to shows_path
    else
      render 'edit'
    end
  end

  def destroy
    Show.find(params[:id]).destroy
    flash[:success] = "Show deleted."
    redirect_to shows_url
  end

  def ind_current
    @current_show = Show.where(:current => true).first
    @is_current_page = true
  end

  def current
    @current_show = Show.where(:current => true).first
    @events = Event.where(:on_homepage => true).sort_by(&:event_date)
    @announcements = Announcement.all
    @artworks = User.all.map{ |artist| artist.artworks.sample }
  end

  def past
    current_show = Show.where(:current => true).first
    start_date = Show.arel_table[:start_date]
    @past_shows = Show.where(start_date.lt(current_show.start_date)).limit(10)
    @is_current_page = false
    render 'past'
  end

  def upcoming
    @current_show = Show.where(:current => true).first
    end_date = Show.arel_table[:end_date]
    @upcoming_shows = Show.where(end_date.gt(@current_show.end_date))
    @is_current_page = false
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
      flash[:notice] = "Only administrators can create shows" unless current_user && current_user.admin?
      redirect_to(root_url) unless current_user && current_user.admin?
    end

    def show_params
      params.require(:show).permit(:name, :description, :short_description, :artists, :start_date, :end_date, :picture_1, :picture_2, :picture_1_caption, :picture_2_caption, :artist_talk_title, :artist_talk_date, :video_link, :video_link_title)
    end
end
