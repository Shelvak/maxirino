class AttachTypesController < ApplicationController
  before_action :set_attach_type, only:  [:show, :edit, :update, :destroy]

  # GET /attach_types
  def index
    @title = t('view.attach_types.index_title')
    @attach_types = AttachType.all.page(params[:page])
  end

  # GET /attach_types/1
  def show
    @title = t('view.attach_types.show_title')
  end

  # GET /attach_types/new
  def new
    @title = t('view.attach_types.new_title')
    @attach_type = AttachType.new
  end

  # GET /attach_types/1/edit
  def edit
    @title = t('view.attach_types.edit_title')
  end

  # POST /attach_types
  def create
    @title = t('view.attach_types.new_title')
    @attach_type = AttachType.new(attach_type_params)

    respond_to do |format|
      if @attach_type.save
        format.html { redirect_to @attach_type, notice: t('view.attach_types.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /attach_types/1
  def update
    @title = t('view.attach_types.edit_title')

    respond_to do |format|
      if @attach_type.update(attach_type_params)
        format.html { redirect_to @attach_type, notice: t('view.attach_types.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_attach_type_url(@attach_type), alert: t('view.attach_types.stale_object_error')
  end

  # DELETE /attach_types/1
  def destroy
    @attach_type.destroy
    redirect_to attach_types_url, notice: t('view.attach_types.correctly_destroyed')
  end

  private

    def set_attach_type
      @attach_type = AttachType.find(params[:id])
    end

    def attach_type_params
      params.require(:attach_type).permit(:name)
    end
end
