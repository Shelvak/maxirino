class PersonQuadrantLinkKindsController < ApplicationController
  before_action :set_person_quadrant_link_kind, only:  [:show, :edit, :update, :destroy]

  # GET /person_quadrant_link_kinds
  def index
    @title = t('view.person_quadrant_link_kinds.index_title')
    @person_quadrant_link_kinds = PersonQuadrantLinkKind.all.page(params[:page])
  end

  # GET /person_quadrant_link_kinds/1
  def show
    @title = t('view.person_quadrant_link_kinds.show_title')
  end

  # GET /person_quadrant_link_kinds/new
  def new
    @title = t('view.person_quadrant_link_kinds.new_title')
    @person_quadrant_link_kind = PersonQuadrantLinkKind.new
  end

  # GET /person_quadrant_link_kinds/1/edit
  def edit
    @title = t('view.person_quadrant_link_kinds.edit_title')
  end

  # POST /person_quadrant_link_kinds
  def create
    @title = t('view.person_quadrant_link_kinds.new_title')
    @person_quadrant_link_kind = PersonQuadrantLinkKind.new(person_quadrant_link_kind_params)

    respond_to do |format|
      if @person_quadrant_link_kind.save
        format.html { redirect_to @person_quadrant_link_kind, notice: t('view.person_quadrant_link_kinds.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /person_quadrant_link_kinds/1
  def update
    @title = t('view.person_quadrant_link_kinds.edit_title')

    respond_to do |format|
      if @person_quadrant_link_kind.update(person_quadrant_link_kind_params)
        format.html { redirect_to @person_quadrant_link_kind, notice: t('view.person_quadrant_link_kinds.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_person_quadrant_link_kind_url(@person_quadrant_link_kind), alert: t('view.person_quadrant_link_kinds.stale_object_error')
  end

  # DELETE /person_quadrant_link_kinds/1
  def destroy
    @person_quadrant_link_kind.destroy
    redirect_to person_quadrant_link_kinds_url, notice: t('view.person_quadrant_link_kinds.correctly_destroyed')
  end

  private

    def set_person_quadrant_link_kind
      @person_quadrant_link_kind = PersonQuadrantLinkKind.find(params[:id])
    end

    def person_quadrant_link_kind_params
      params.require(:person_quadrant_link_kind).permit(:name)
    end
end
