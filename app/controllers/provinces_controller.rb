class ProvincesController < ApplicationController
  before_action :set_province, only:  [:show, :edit, :update, :destroy]

  # GET /provinces
  def index
    @title = t('view.provinces.index_title')
    @provinces = Province.all.page(params[:page])
  end

  # GET /provinces/1
  def show
    @title = t('view.provinces.show_title')
  end

  # GET /provinces/new
  def new
    @title = t('view.provinces.new_title')
    @province = Province.new
  end

  # GET /provinces/1/edit
  def edit
    @title = t('view.provinces.edit_title')
  end

  # POST /provinces
  def create
    @title = t('view.provinces.new_title')
    @province = Province.new(province_params)

    respond_to do |format|
      if @province.save
        format.html { redirect_to @province, notice: t('view.provinces.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /provinces/1
  def update
    @title = t('view.provinces.edit_title')

    respond_to do |format|
      if @province.update(province_params)
        format.html { redirect_to @province, notice: t('view.provinces.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_province_url(@province), alert: t('view.provinces.stale_object_error')
  end

  # DELETE /provinces/1
  def destroy
    @province.destroy
    redirect_to provinces_url, notice: t('view.provinces.correctly_destroyed')
  end

  private

    def set_province
      @province = Province.find(params[:id])
    end

    def province_params
      params.require(:province).permit(:name, :country_id)
    end
end
