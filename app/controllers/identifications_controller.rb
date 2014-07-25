class IdentificationsController < ApplicationController
  before_action :set_identification, only:  [:show, :edit, :update, :destroy]

  # GET /identifications
  def index
    @title = t('view.identifications.index_title')
    @identifications = Identification.all.page(params[:page])
  end

  # GET /identifications/1
  def show
    @title = t('view.identifications.show_title')
  end

  # GET /identifications/new
  def new
    @title = t('view.identifications.new_title')
    @identification = Identification.new
  end

  # GET /identifications/1/edit
  def edit
    @title = t('view.identifications.edit_title')
  end

  # POST /identifications
  def create
    @title = t('view.identifications.new_title')
    @identification = Identification.new(identification_params)

    respond_to do |format|
      if @identification.save
        format.html { redirect_to @identification, notice: t('view.identifications.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /identifications/1
  def update
    @title = t('view.identifications.edit_title')

    respond_to do |format|
      if @identification.update(identification_params)
        format.html { redirect_to @identification, notice: t('view.identifications.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_identification_url(@identification), alert: t('view.identifications.stale_object_error')
  end

  # DELETE /identifications/1
  def destroy
    @identification.destroy
    redirect_to identifications_url, notice: t('view.identifications.correctly_destroyed')
  end

  private

    def set_identification
      @identification = Identification.find(params[:id])
    end

    def identification_params
      params.require(:identification).permit(:number, :person_id, :identification_type_id)
    end
end
