class SectorsController < ApplicationController
  before_action :set_sector, only:  [:show, :edit, :update, :destroy]

  # GET /sectors
  def index
    @title = t('view.sectors.index_title')
    @sectors = Sector.all.page(params[:page])
  end

  # GET /sectors/1
  def show
    @title = t('view.sectors.show_title')
  end

  # GET /sectors/new
  def new
    @title = t('view.sectors.new_title')
    @sector = Sector.new
  end

  # GET /sectors/1/edit
  def edit
    @title = t('view.sectors.edit_title')
  end

  # POST /sectors
  def create
    @title = t('view.sectors.new_title')
    @sector = Sector.new(sector_params)

    respond_to do |format|
      if @sector.save
        format.html { redirect_to @sector, notice: t('view.sectors.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /sectors/1
  def update
    @title = t('view.sectors.edit_title')

    respond_to do |format|
      if @sector.update(sector_params)
        format.html { redirect_to @sector, notice: t('view.sectors.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_sector_url(@sector), alert: t('view.sectors.stale_object_error')
  end

  # DELETE /sectors/1
  def destroy
    @sector.destroy
    redirect_to sectors_url, notice: t('view.sectors.correctly_destroyed')
  end

  private

    def set_sector
      @sector = Sector.find(params[:id])
    end

    def sector_params
      params.require(:sector).permit(:name)
    end
end
