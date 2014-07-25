class CountriesController < ApplicationController
  before_action :set_country, only:  [:show, :edit, :update, :destroy]

  # GET /countries
  def index
    @title = t('view.countries.index_title')
    @countries = Country.all.page(params[:page])
  end

  # GET /countries/1
  def show
    @title = t('view.countries.show_title')
  end

  # GET /countries/new
  def new
    @title = t('view.countries.new_title')
    @country = Country.new
  end

  # GET /countries/1/edit
  def edit
    @title = t('view.countries.edit_title')
  end

  # POST /countries
  def create
    @title = t('view.countries.new_title')
    @country = Country.new(country_params)

    respond_to do |format|
      if @country.save
        format.html { redirect_to @country, notice: t('view.countries.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /countries/1
  def update
    @title = t('view.countries.edit_title')

    respond_to do |format|
      if @country.update(country_params)
        format.html { redirect_to @country, notice: t('view.countries.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_country_url(@country), alert: t('view.countries.stale_object_error')
  end

  # DELETE /countries/1
  def destroy
    @country.destroy
    redirect_to countries_url, notice: t('view.countries.correctly_destroyed')
  end

  private

    def set_country
      @country = Country.find(params[:id])
    end

    def country_params
      params.require(:country).permit(:name)
    end
end
