class TownsController < ApplicationController
  before_action :set_town, only:  [:show, :edit, :update, :destroy]

  # GET /towns
  def index
    @title = t('view.towns.index_title')
    @towns = Town.all.page(params[:page])
  end

  # GET /towns/1
  def show
    @title = t('view.towns.show_title')
  end

  # GET /towns/new
  def new
    @title = t('view.towns.new_title')
    @town = Town.new
  end

  # GET /towns/1/edit
  def edit
    @title = t('view.towns.edit_title')
  end

  # POST /towns
  def create
    @title = t('view.towns.new_title')
    @town = Town.new(town_params)

    respond_to do |format|
      if @town.save
        format.html { redirect_to @town, notice: t('view.towns.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /towns/1
  def update
    @title = t('view.towns.edit_title')

    respond_to do |format|
      if @town.update(town_params)
        format.html { redirect_to @town, notice: t('view.towns.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_town_url(@town), alert: t('view.towns.stale_object_error')
  end

  # DELETE /towns/1
  def destroy
    @town.destroy
    redirect_to towns_url, notice: t('view.towns.correctly_destroyed')
  end

  private

    def set_town
      @town = Town.find(params[:id])
    end

    def town_params
      params.require(:town).permit(:name, :city_id)
    end
end
