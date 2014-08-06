class InvestigationsController < ApplicationController
  before_action :set_investigation, only:  [:show, :edit, :update, :destroy]

  # GET /investigations
  def index
    @title = t('view.investigations.index_title')
    @investigations = Investigation.all.page(params[:page])
  end

  # GET /investigations/1
  def show
    @title = t('view.investigations.show_title')
  end

  # GET /investigations/new
  def new
    @title = t('view.investigations.new_title')
    @investigation = Investigation.new
  end

  # GET /investigations/1/edit
  def edit
    @title = t('view.investigations.edit_title')
  end

  # POST /investigations
  def create
    @title = t('view.investigations.new_title')
    @investigation = Investigation.new(investigation_params)

    respond_to do |format|
      if @investigation.save
        format.html { redirect_to @investigation, notice: t('view.investigations.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /investigations/1
  def update
    @title = t('view.investigations.edit_title')

    respond_to do |format|
      if @investigation.update(investigation_params)
        format.html { redirect_to @investigation, notice: t('view.investigations.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_investigation_url(@investigation), alert: t('view.investigations.stale_object_error')
  end

  # DELETE /investigations/1
  def destroy
    @investigation.destroy
    redirect_to investigations_url, notice: t('view.investigations.correctly_destroyed')
  end

  private

    def set_investigation
      @investigation = Investigation.find(params[:id])
    end

    def investigation_params
      params.require(:investigation).permit(:status_id, :category_id, :start_date, :end_date, :title, :detail, :auto_name, autocomplete_address_ids: [], autocomplete_person_ids: [])
    end
end
