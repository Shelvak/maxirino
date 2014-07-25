class InvestigationStatusesController < ApplicationController
  before_action :set_investigation_status, only:  [:show, :edit, :update, :destroy]

  # GET /investigation_statuses
  def index
    @title = t('view.investigation_statuses.index_title')
    @investigation_statuses = InvestigationStatus.all.page(params[:page])
  end

  # GET /investigation_statuses/1
  def show
    @title = t('view.investigation_statuses.show_title')
  end

  # GET /investigation_statuses/new
  def new
    @title = t('view.investigation_statuses.new_title')
    @investigation_status = InvestigationStatus.new
  end

  # GET /investigation_statuses/1/edit
  def edit
    @title = t('view.investigation_statuses.edit_title')
  end

  # POST /investigation_statuses
  def create
    @title = t('view.investigation_statuses.new_title')
    @investigation_status = InvestigationStatus.new(investigation_status_params)

    respond_to do |format|
      if @investigation_status.save
        format.html { redirect_to @investigation_status, notice: t('view.investigation_statuses.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /investigation_statuses/1
  def update
    @title = t('view.investigation_statuses.edit_title')

    respond_to do |format|
      if @investigation_status.update(investigation_status_params)
        format.html { redirect_to @investigation_status, notice: t('view.investigation_statuses.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_investigation_status_url(@investigation_status), alert: t('view.investigation_statuses.stale_object_error')
  end

  # DELETE /investigation_statuses/1
  def destroy
    @investigation_status.destroy
    redirect_to investigation_statuses_url, notice: t('view.investigation_statuses.correctly_destroyed')
  end

  private

    def set_investigation_status
      @investigation_status = InvestigationStatus.find(params[:id])
    end

    def investigation_status_params
      params.require(:investigation_status).permit(:name)
    end
end
