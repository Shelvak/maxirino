class PeopleController < ApplicationController
  before_action :set_person, only:  [:show, :edit, :update, :destroy]

  # GET /people
  def index
    @title = t('view.people.index_title')
    @people = Person.all.page(params[:page])
  end

  # GET /people/1
  def show
    @title = t('view.people.show_title')
  end

  # GET /people/new
  def new
    @title = t('view.people.new_title')
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
    @title = t('view.people.edit_title')
  end

  # POST /people
  def create
    @title = t('view.people.new_title')
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: t('view.people.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /people/1
  def update
    @title = t('view.people.edit_title')

    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: t('view.people.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_person_url(@person), alert: t('view.people.stale_object_error')
  end

  # DELETE /people/1
  def destroy
    @person.destroy
    redirect_to people_url, notice: t('view.people.correctly_destroyed')
  end

  private

    def set_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(
        :first_name, :last_name, :birthday, :father, :mother, :notes,
        :sex, :alias
      )
    end
end
