class ZonesController < ApplicationController
  before_action :set_zone, only:  [:show, :edit, :update, :destroy]

  # GET /zones
  def index
    @title = t('view.zones.index_title')
    @zones = Zone.all.page(params[:page])
  end

  # GET /zones/1
  def show
    @title = t('view.zones.show_title')
  end

  # GET /zones/new
  def new
    @title = t('view.zones.new_title')
    @zone = Zone.new
  end

  # GET /zones/1/edit
  def edit
    @title = t('view.zones.edit_title')
  end

  # POST /zones
  def create
    @title = t('view.zones.new_title')
    @zone = Zone.new(zone_params)

    respond_to do |format|
      if @zone.save
        format.html { redirect_to @zone, notice: t('view.zones.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /zones/1
  def update
    @title = t('view.zones.edit_title')

    respond_to do |format|
      if @zone.update(zone_params)
        format.html { redirect_to @zone, notice: t('view.zones.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_zone_url(@zone), alert: t('view.zones.stale_object_error')
  end

  # DELETE /zones/1
  def destroy
    @zone.destroy
    redirect_to zones_url, notice: t('view.zones.correctly_destroyed')
  end

  private

    def set_zone
      @zone = Zone.find(params[:id])
    end

    def zone_params
      params.require(:zone).permit(:name)
    end
end
