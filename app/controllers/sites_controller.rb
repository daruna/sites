class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy]

  def index
    @sites = Site.order(:created_at).page params[:page]
  end

  def show
  end

  def new
    @site = Site.new
  end

  def edit
  end

  def create
    @site = Site.new(site_params)

    if @site.save
      redirect_to sites_url, flash: { success: 'Запись успешно создана' }
    else
      render :new
    end
  end

  def update
    if @site.update(site_params)
      redirect_to sites_url, flash: { success: 'Запись успешно обновлена' }
    else
      render :edit
    end
  end

  def destroy
    @site.destroy
    redirect_to sites_url, flash: { success: 'Запись успешно удалена' }
  end

  private
    def set_site
      @site = Site.find(params[:id])
    end

    def site_params
      params.require(:site).permit(:title, :available)
    end
end
