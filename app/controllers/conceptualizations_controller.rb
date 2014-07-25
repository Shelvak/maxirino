class ConceptualizationsController < ApplicationController
  before_action :set_conceptualization, only:  [:show, :edit, :update, :destroy]

  # GET /conceptualizations
  def index
    @title = t('view.conceptualizations.index_title')
    @conceptualizations = Conceptualization.all.page(params[:page])
  end

  # GET /conceptualizations/1
  def show
    @title = t('view.conceptualizations.show_title')
  end

  # GET /conceptualizations/new
  def new
    @title = t('view.conceptualizations.new_title')
    @conceptualization = Conceptualization.new
  end

  # GET /conceptualizations/1/edit
  def edit
    @title = t('view.conceptualizations.edit_title')
  end

  # POST /conceptualizations
  def create
    @title = t('view.conceptualizations.new_title')
    @conceptualization = Conceptualization.new(conceptualization_params)

    respond_to do |format|
      if @conceptualization.save
        format.html { redirect_to @conceptualization, notice: t('view.conceptualizations.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /conceptualizations/1
  def update
    @title = t('view.conceptualizations.edit_title')

    respond_to do |format|
      if @conceptualization.update(conceptualization_params)
        format.html { redirect_to @conceptualization, notice: t('view.conceptualizations.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_conceptualization_url(@conceptualization), alert: t('view.conceptualizations.stale_object_error')
  end

  # DELETE /conceptualizations/1
  def destroy
    @conceptualization.destroy
    redirect_to conceptualizations_url, notice: t('view.conceptualizations.correctly_destroyed')
  end

  private

    def set_conceptualization
      @conceptualization = Conceptualization.find(params[:id])
    end

    def conceptualization_params
      params.require(:conceptualization).permit(:name)
    end
end
