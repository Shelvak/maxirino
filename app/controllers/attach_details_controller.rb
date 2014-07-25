class AttachDetailsController < ApplicationController
  before_action :set_attach_detail, only:  [:show, :edit, :update, :destroy]

  # GET /attach_details
  def index
    @title = t('view.attach_details.index_title')
    @attach_details = AttachDetail.all.page(params[:page])
  end

  # GET /attach_details/1
  def show
    @title = t('view.attach_details.show_title')
  end

  # GET /attach_details/new
  def new
    @title = t('view.attach_details.new_title')
    @attach_detail = AttachDetail.new
  end

  # GET /attach_details/1/edit
  def edit
    @title = t('view.attach_details.edit_title')
  end

  # POST /attach_details
  def create
    @title = t('view.attach_details.new_title')
    @attach_detail = AttachDetail.new(attach_detail_params)

    respond_to do |format|
      if @attach_detail.save
        format.html { redirect_to @attach_detail, notice: t('view.attach_details.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /attach_details/1
  def update
    @title = t('view.attach_details.edit_title')

    respond_to do |format|
      if @attach_detail.update(attach_detail_params)
        format.html { redirect_to @attach_detail, notice: t('view.attach_details.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_attach_detail_url(@attach_detail), alert: t('view.attach_details.stale_object_error')
  end

  # DELETE /attach_details/1
  def destroy
    @attach_detail.destroy
    redirect_to attach_details_url, notice: t('view.attach_details.correctly_destroyed')
  end

  private

    def set_attach_detail
      @attach_detail = AttachDetail.find(params[:id])
    end

    def attach_detail_params
      params.require(:attach_detail).permit(:from, :details, :attach_id)
    end
end
