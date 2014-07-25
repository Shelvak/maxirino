class QuadrantsController < ApplicationController
  before_action :set_quadrant, only:  [:show, :edit, :update, :destroy]

  # GET /quadrants
  def index
    @title = t('view.quadrants.index_title')
    @quadrants = Quadrant.all.page(params[:page])
  end

  # GET /quadrants/1
  def show
    @title = t('view.quadrants.show_title')
  end

  # GET /quadrants/new
  def new
    @title = t('view.quadrants.new_title')
    @quadrant = Quadrant.new
  end

  # GET /quadrants/1/edit
  def edit
    @title = t('view.quadrants.edit_title')
  end

  # POST /quadrants
  def create
    @title = t('view.quadrants.new_title')
    @quadrant = Quadrant.new(quadrant_params)

    respond_to do |format|
      if @quadrant.save
        format.html { redirect_to @quadrant, notice: t('view.quadrants.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /quadrants/1
  def update
    @title = t('view.quadrants.edit_title')

    respond_to do |format|
      if @quadrant.update(quadrant_params)
        format.html { redirect_to @quadrant, notice: t('view.quadrants.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_quadrant_url(@quadrant), alert: t('view.quadrants.stale_object_error')
  end

  # DELETE /quadrants/1
  def destroy
    @quadrant.destroy
    redirect_to quadrants_url, notice: t('view.quadrants.correctly_destroyed')
  end

  private

    def set_quadrant
      @quadrant = Quadrant.find(params[:id])
    end

    def quadrant_params
      params.require(:quadrant).permit(:name)
    end
end
