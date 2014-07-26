class PersonAddressesController < ApplicationController
  before_action :set_person_address, only:  [:show, :edit, :update, :destroy]

  # GET /person_addresses
  def index
    @title = t('view.person_addresses.index_title')
    @person_addresses = PersonAddress.all.page(params[:page])
  end

  # GET /person_addresses/1
  def show
    @title = t('view.person_addresses.show_title')
  end

  # GET /person_addresses/new
  def new
    @title = t('view.person_addresses.new_title')
    @person_address = PersonAddress.new
  end

  # GET /person_addresses/1/edit
  def edit
    @title = t('view.person_addresses.edit_title')
  end

  # POST /person_addresses
  def create
    @title = t('view.person_addresses.new_title')
    @person_address = PersonAddress.new(person_address_params)

    respond_to do |format|
      if @person_address.save
        format.html { redirect_to @person_address, notice: t('view.person_addresses.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /person_addresses/1
  def update
    @title = t('view.person_addresses.edit_title')

    respond_to do |format|
      if @person_address.update(person_address_params)
        format.html { redirect_to @person_address, notice: t('view.person_addresses.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_person_address_url(@person_address), alert: t('view.person_addresses.stale_object_error')
  end

  # DELETE /person_addresses/1
  def destroy
    @person_address.destroy
    redirect_to person_addresses_url, notice: t('view.person_addresses.correctly_destroyed')
  end

  private

    def set_person_address
      @person_address = PersonAddress.find(params[:id])
    end

    def person_address_params
      params.require(:person_address).permit(:person_id, :address_id, :country_id, :province_id, :city_id, :zone_id, :street_name, :street_number)
    end
end
