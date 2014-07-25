class PeopleRelationKindsController < ApplicationController
  before_action :set_people_relation_kind, only:  [:show, :edit, :update, :destroy]

  # GET /people_relation_kinds
  def index
    @title = t('view.people_relation_kinds.index_title')
    @people_relation_kinds = PeopleRelationKind.all.page(params[:page])
  end

  # GET /people_relation_kinds/1
  def show
    @title = t('view.people_relation_kinds.show_title')
  end

  # GET /people_relation_kinds/new
  def new
    @title = t('view.people_relation_kinds.new_title')
    @people_relation_kind = PeopleRelationKind.new
  end

  # GET /people_relation_kinds/1/edit
  def edit
    @title = t('view.people_relation_kinds.edit_title')
  end

  # POST /people_relation_kinds
  def create
    @title = t('view.people_relation_kinds.new_title')
    @people_relation_kind = PeopleRelationKind.new(people_relation_kind_params)

    respond_to do |format|
      if @people_relation_kind.save
        format.html { redirect_to @people_relation_kind, notice: t('view.people_relation_kinds.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /people_relation_kinds/1
  def update
    @title = t('view.people_relation_kinds.edit_title')

    respond_to do |format|
      if @people_relation_kind.update(people_relation_kind_params)
        format.html { redirect_to @people_relation_kind, notice: t('view.people_relation_kinds.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_people_relation_kind_url(@people_relation_kind), alert: t('view.people_relation_kinds.stale_object_error')
  end

  # DELETE /people_relation_kinds/1
  def destroy
    @people_relation_kind.destroy
    redirect_to people_relation_kinds_url, notice: t('view.people_relation_kinds.correctly_destroyed')
  end

  private

    def set_people_relation_kind
      @people_relation_kind = PeopleRelationKind.find(params[:id])
    end

    def people_relation_kind_params
      params.require(:people_relation_kind).permit(:name)
    end
end
