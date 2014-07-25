class PhysicalFeaturesController < ApplicationController
  before_action :set_physical_feature, only:  [:show, :edit, :update, :destroy]

  # GET /physical_features
  def index
    @title = t('view.physical_features.index_title')
    @physical_features = PhysicalFeature.all.page(params[:page])
  end

  # GET /physical_features/1
  def show
    @title = t('view.physical_features.show_title')
  end

  # GET /physical_features/new
  def new
    @title = t('view.physical_features.new_title')
    @physical_feature = PhysicalFeature.new
  end

  # GET /physical_features/1/edit
  def edit
    @title = t('view.physical_features.edit_title')
  end

  # POST /physical_features
  def create
    @title = t('view.physical_features.new_title')
    @physical_feature = PhysicalFeature.new(physical_feature_params)

    respond_to do |format|
      if @physical_feature.save
        format.html { redirect_to @physical_feature, notice: t('view.physical_features.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /physical_features/1
  def update
    @title = t('view.physical_features.edit_title')

    respond_to do |format|
      if @physical_feature.update(physical_feature_params)
        format.html { redirect_to @physical_feature, notice: t('view.physical_features.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_physical_feature_url(@physical_feature), alert: t('view.physical_features.stale_object_error')
  end

  # DELETE /physical_features/1
  def destroy
    @physical_feature.destroy
    redirect_to physical_features_url, notice: t('view.physical_features.correctly_destroyed')
  end

  private

    def set_physical_feature
      @physical_feature = PhysicalFeature.find(params[:id])
    end

    def physical_feature_params
      params.require(:physical_feature).permit(:name)
    end
end
