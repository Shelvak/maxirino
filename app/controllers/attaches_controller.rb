class AttachesController < ApplicationController
  before_action :set_attach, only:  [:show, :edit, :update, :destroy]

  # GET /attaches
  def index
    @title = t('view.attaches.index_title')
    @attaches = Attach.all.page(params[:page])
  end

  # GET /attaches/1
  def show
    @title = t('view.attaches.show_title')
  end

  # GET /attaches/new
  def new
    @title = t('view.attaches.new_title')
    @attach = Attach.new
  end

  # GET /attaches/1/edit
  def edit
    @title = t('view.attaches.edit_title')
  end

  # POST /attaches
  def create
    @title = t('view.attaches.new_title')
    @attach = Attach.new(attach_params)

    respond_to do |format|
      if @attach.save
        format.html { redirect_to @attach, notice: t('view.attaches.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /attaches/1
  def update
    @title = t('view.attaches.edit_title')

    respond_to do |format|
      if @attach.update(attach_params)
        format.html { redirect_to @attach, notice: t('view.attaches.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_attach_url(@attach), alert: t('view.attaches.stale_object_error')
  end

  # DELETE /attaches/1
  def destroy
    @attach.destroy
    redirect_to attaches_url, notice: t('view.attaches.correctly_destroyed')
  end

  private

    def set_attach
      @attach = Attach.find(params[:id])
    end

    def attach_params
      params.require(:attach).permit(:attach_type_id, :file, :title, :person_id)
    end
end
