class InvestigationCategoriesController < ApplicationController
  before_action :set_investigation_category, only:  [:show, :edit, :update, :destroy]

  # GET /investigation_categories
  def index
    @title = t('view.investigation_categories.index_title')
    @investigation_categories = InvestigationCategory.all.page(params[:page])
  end

  # GET /investigation_categories/1
  def show
    @title = t('view.investigation_categories.show_title')
  end

  # GET /investigation_categories/new
  def new
    @title = t('view.investigation_categories.new_title')
    @investigation_category = InvestigationCategory.new
  end

  # GET /investigation_categories/1/edit
  def edit
    @title = t('view.investigation_categories.edit_title')
  end

  # POST /investigation_categories
  def create
    @title = t('view.investigation_categories.new_title')
    @investigation_category = InvestigationCategory.new(investigation_category_params)

    respond_to do |format|
      if @investigation_category.save
        format.html { redirect_to @investigation_category, notice: t('view.investigation_categories.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /investigation_categories/1
  def update
    @title = t('view.investigation_categories.edit_title')

    respond_to do |format|
      if @investigation_category.update(investigation_category_params)
        format.html { redirect_to @investigation_category, notice: t('view.investigation_categories.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_investigation_category_url(@investigation_category), alert: t('view.investigation_categories.stale_object_error')
  end

  # DELETE /investigation_categories/1
  def destroy
    @investigation_category.destroy
    redirect_to investigation_categories_url, notice: t('view.investigation_categories.correctly_destroyed')
  end

  private

    def set_investigation_category
      @investigation_category = InvestigationCategory.find(params[:id])
    end

    def investigation_category_params
      params.require(:investigation_category).permit(:name)
    end
end
