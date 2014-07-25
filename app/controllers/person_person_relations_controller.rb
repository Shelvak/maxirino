class PersonPersonRelationsController < ApplicationController
  before_action :set_person_person_relation, only:  [:show, :edit, :update, :destroy]

  # GET /person_person_relations
  def index
    @title = t('view.person_person_relations.index_title')
    @person_person_relations = PersonPersonRelation.all.page(params[:page])
  end

  # GET /person_person_relations/1
  def show
    @title = t('view.person_person_relations.show_title')
  end

  # GET /person_person_relations/new
  def new
    @title = t('view.person_person_relations.new_title')
    @person_person_relation = PersonPersonRelation.new
  end

  # GET /person_person_relations/1/edit
  def edit
    @title = t('view.person_person_relations.edit_title')
  end

  # POST /person_person_relations
  def create
    @title = t('view.person_person_relations.new_title')
    @person_person_relation = PersonPersonRelation.new(person_person_relation_params)

    respond_to do |format|
      if @person_person_relation.save
        format.html { redirect_to @person_person_relation, notice: t('view.person_person_relations.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /person_person_relations/1
  def update
    @title = t('view.person_person_relations.edit_title')

    respond_to do |format|
      if @person_person_relation.update(person_person_relation_params)
        format.html { redirect_to @person_person_relation, notice: t('view.person_person_relations.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_person_person_relation_url(@person_person_relation), alert: t('view.person_person_relations.stale_object_error')
  end

  # DELETE /person_person_relations/1
  def destroy
    @person_person_relation.destroy
    redirect_to person_person_relations_url, notice: t('view.person_person_relations.correctly_destroyed')
  end

  private

    def set_person_person_relation
      @person_person_relation = PersonPersonRelation.find(params[:id])
    end

    def person_person_relation_params
      params.require(:person_person_relation).permit(:person_1_id, :person_2_id, :link_type_id, :since_date, :until_date)
    end
end
