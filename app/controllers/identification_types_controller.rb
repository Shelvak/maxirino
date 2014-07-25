class IdentificationTypesController < ApplicationController
  before_action :set_identification_type, only:  [:show, :edit, :update, :destroy]

  # GET /identification_types
  def index
    @title = t('view.identification_types.index_title')
    @identification_types = IdentificationType.all.page(params[:page])
  end

  # GET /identification_types/1
  def show
    @title = t('view.identification_types.show_title')
  end

  # GET /identification_types/new
  def new
    @title = t('view.identification_types.new_title')
    @identification_type = IdentificationType.new
  end

  # GET /identification_types/1/edit
  def edit
    @title = t('view.identification_types.edit_title')
  end

  # POST /identification_types
  def create
    @title = t('view.identification_types.new_title')
    @identification_type = IdentificationType.new(identification_type_params)

    respond_to do |format|
      if @identification_type.save
        format.html { redirect_to @identification_type, notice: t('view.identification_types.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /identification_types/1
  def update
    @title = t('view.identification_types.edit_title')

    respond_to do |format|
      if @identification_type.update(identification_type_params)
        format.html { redirect_to @identification_type, notice: t('view.identification_types.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_identification_type_url(@identification_type), alert: t('view.identification_types.stale_object_error')
  end

  # DELETE /identification_types/1
  def destroy
    @identification_type.destroy
    redirect_to identification_types_url, notice: t('view.identification_types.correctly_destroyed')
  end

  private

    def set_identification_type
      @identification_type = IdentificationType.find(params[:id])
    end

    def identification_type_params
      params.require(:identification_type).permit(:name)
    end
end
