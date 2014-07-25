class ActionZonesController < ApplicationController
  before_action :set_action_zone, only:  [:show, :edit, :update, :destroy]

  # GET /action_zones
  def index
    @title = t('view.action_zones.index_title')
    @action_zones = ActionZone.all.page(params[:page])
  end

  # GET /action_zones/1
  def show
    @title = t('view.action_zones.show_title')
  end

  # GET /action_zones/new
  def new
    @title = t('view.action_zones.new_title')
    @action_zone = ActionZone.new
  end

  # GET /action_zones/1/edit
  def edit
    @title = t('view.action_zones.edit_title')
  end

  # POST /action_zones
  def create
    @title = t('view.action_zones.new_title')
    @action_zone = ActionZone.new(action_zone_params)

    respond_to do |format|
      if @action_zone.save
        format.html { redirect_to @action_zone, notice: t('view.action_zones.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /action_zones/1
  def update
    @title = t('view.action_zones.edit_title')

    respond_to do |format|
      if @action_zone.update(action_zone_params)
        format.html { redirect_to @action_zone, notice: t('view.action_zones.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_action_zone_url(@action_zone), alert: t('view.action_zones.stale_object_error')
  end

  # DELETE /action_zones/1
  def destroy
    @action_zone.destroy
    redirect_to action_zones_url, notice: t('view.action_zones.correctly_destroyed')
  end

  private

    def set_action_zone
      @action_zone = ActionZone.find(params[:id])
    end

    def action_zone_params
      params.require(:action_zone).permit(:name)
    end
end
