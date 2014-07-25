class AddressSectorRelationsController < ApplicationController
  before_action :set_address_sector_relation, only:  [:show, :edit, :update, :destroy]

  # GET /address_sector_relations
  def index
    @title = t('view.address_sector_relations.index_title')
    @address_sector_relations = AddressSectorRelation.all.page(params[:page])
  end

  # GET /address_sector_relations/1
  def show
    @title = t('view.address_sector_relations.show_title')
  end

  # GET /address_sector_relations/new
  def new
    @title = t('view.address_sector_relations.new_title')
    @address_sector_relation = AddressSectorRelation.new
  end

  # GET /address_sector_relations/1/edit
  def edit
    @title = t('view.address_sector_relations.edit_title')
  end

  # POST /address_sector_relations
  def create
    @title = t('view.address_sector_relations.new_title')
    @address_sector_relation = AddressSectorRelation.new(address_sector_relation_params)

    respond_to do |format|
      if @address_sector_relation.save
        format.html { redirect_to @address_sector_relation, notice: t('view.address_sector_relations.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /address_sector_relations/1
  def update
    @title = t('view.address_sector_relations.edit_title')

    respond_to do |format|
      if @address_sector_relation.update(address_sector_relation_params)
        format.html { redirect_to @address_sector_relation, notice: t('view.address_sector_relations.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_address_sector_relation_url(@address_sector_relation), alert: t('view.address_sector_relations.stale_object_error')
  end

  # DELETE /address_sector_relations/1
  def destroy
    @address_sector_relation.destroy
    redirect_to address_sector_relations_url, notice: t('view.address_sector_relations.correctly_destroyed')
  end

  private

    def set_address_sector_relation
      @address_sector_relation = AddressSectorRelation.find(params[:id])
    end

    def address_sector_relation_params
      params.require(:address_sector_relation).permit(:address_id, :sector_id, :percentage, :detail)
    end
end
