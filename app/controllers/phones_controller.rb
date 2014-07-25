class PhonesController < ApplicationController
  before_action :set_phone, only:  [:show, :edit, :update, :destroy]

  # GET /phones
  def index
    @title = t('view.phones.index_title')
    @phones = Phone.all.page(params[:page])
  end

  # GET /phones/1
  def show
    @title = t('view.phones.show_title')
  end

  # GET /phones/new
  def new
    @title = t('view.phones.new_title')
    @phone = Phone.new
  end

  # GET /phones/1/edit
  def edit
    @title = t('view.phones.edit_title')
  end

  # POST /phones
  def create
    @title = t('view.phones.new_title')
    @phone = Phone.new(phone_params)

    respond_to do |format|
      if @phone.save
        format.html { redirect_to @phone, notice: t('view.phones.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /phones/1
  def update
    @title = t('view.phones.edit_title')

    respond_to do |format|
      if @phone.update(phone_params)
        format.html { redirect_to @phone, notice: t('view.phones.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_phone_url(@phone), alert: t('view.phones.stale_object_error')
  end

  # DELETE /phones/1
  def destroy
    @phone.destroy
    redirect_to phones_url, notice: t('view.phones.correctly_destroyed')
  end

  private

    def set_phone
      @phone = Phone.find(params[:id])
    end

    def phone_params
      params.require(:phone).permit(:person_id, :phone, :details)
    end
end
