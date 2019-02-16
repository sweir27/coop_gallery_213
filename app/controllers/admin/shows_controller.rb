class Admin::ShowsController < Admin::BaseController
  before_action :require_admin

  def index
    @shows = Show.all
    today = Date.today

    if params[:past]
      @shows = @shows.where("end_date < ?", today)
    elsif params[:current]
      @shows = @shows.where("start_date <= ? AND end_date >= ?", today, today)
    elsif params[:upcoming]
      @shows = @shows.where("start_date > ?", today)
    end

    @shows = @shows.order(start_date: :desc).page(params[:page])
    @shows
  end

  def new
    @show = Show.new
  end

  def show
    @show = Show.find(params[:id])
  end

  def create
    @show = Show.new(show_params)
    if @show.save
      flash[:success] = "New show created"
      redirect_to admin_shows_path
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
      redirect_to admin_shows_path
    else
      render 'edit'
    end
  end

  def destroy
    Show.find(params[:id]).destroy
    flash[:success] = "Show deleted."
    redirect_to shows_url
  end

  def set_current
    show = Show.find(params[:id])
    Show.update_all(:current => false)
    show.toggle!(:current)
    redirect_to shows_url
  end

  private

  def show_params
    params.require(:show).permit(:name, :description, :short_description, :artists, :start_date, :end_date, :picture_1, :picture_2, :picture_1_caption, :picture_2_caption, :third_thursday_talk_title, :third_thursday_talk_date, :video_link, :video_link_title)
  end
end
