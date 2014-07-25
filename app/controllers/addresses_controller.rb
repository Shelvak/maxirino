class AddressesController < ApplicationController
  before_action :set_address, only:  [:show, :edit, :update, :destroy]

  # GET /addresses
  def index
    @title = t('view.addresses.index_title')
    @addresses = Address.all.page(params[:page])
  end

  # GET /addresses/1
  def show
    @title = t('view.addresses.show_title')
  end

  # GET /addresses/new
  def new
    @title = t('view.addresses.new_title')
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
    @title = t('view.addresses.edit_title')
  end

  # POST /addresses
  def create
    @title = t('view.addresses.new_title')
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to @address, notice: t('view.addresses.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /addresses/1
  def update
    @title = t('view.addresses.edit_title')

    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @address, notice: t('view.addresses.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_address_url(@address), alert: t('view.addresses.stale_object_error')
  end

  # DELETE /addresses/1
  def destroy
    @address.destroy
    redirect_to addresses_url, notice: t('view.addresses.correctly_destroyed')
  end

  private

    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:address_type_id, :number, :between, :street, :notes)
    end
end
