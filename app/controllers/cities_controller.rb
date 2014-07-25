class CitiesController < ApplicationController
  before_action :set_city, only:  [:show, :edit, :update, :destroy]

  # GET /cities
  def index
    @title = t('view.cities.index_title')
    @cities = City.all.page(params[:page])
  end

  # GET /cities/1
  def show
    @title = t('view.cities.show_title')
  end

  # GET /cities/new
  def new
    @title = t('view.cities.new_title')
    @city = City.new
  end

  # GET /cities/1/edit
  def edit
    @title = t('view.cities.edit_title')
  end

  # POST /cities
  def create
    @title = t('view.cities.new_title')
    @city = City.new(city_params)

    respond_to do |format|
      if @city.save
        format.html { redirect_to @city, notice: t('view.cities.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /cities/1
  def update
    @title = t('view.cities.edit_title')

    respond_to do |format|
      if @city.update(city_params)
        format.html { redirect_to @city, notice: t('view.cities.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_city_url(@city), alert: t('view.cities.stale_object_error')
  end

  # DELETE /cities/1
  def destroy
    @city.destroy
    redirect_to cities_url, notice: t('view.cities.correctly_destroyed')
  end

  private

    def set_city
      @city = City.find(params[:id])
    end

    def city_params
      params.require(:city).permit(:name, :province_id)
    end
end
