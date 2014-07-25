class AddressLinkKindsController < ApplicationController
  before_action :set_address_link_kind, only:  [:show, :edit, :update, :destroy]

  # GET /address_link_kinds
  def index
    @title = t('view.address_link_kinds.index_title')
    @address_link_kinds = AddressLinkKind.all.page(params[:page])
  end

  # GET /address_link_kinds/1
  def show
    @title = t('view.address_link_kinds.show_title')
  end

  # GET /address_link_kinds/new
  def new
    @title = t('view.address_link_kinds.new_title')
    @address_link_kind = AddressLinkKind.new
  end

  # GET /address_link_kinds/1/edit
  def edit
    @title = t('view.address_link_kinds.edit_title')
  end

  # POST /address_link_kinds
  def create
    @title = t('view.address_link_kinds.new_title')
    @address_link_kind = AddressLinkKind.new(address_link_kind_params)

    respond_to do |format|
      if @address_link_kind.save
        format.html { redirect_to @address_link_kind, notice: t('view.address_link_kinds.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /address_link_kinds/1
  def update
    @title = t('view.address_link_kinds.edit_title')

    respond_to do |format|
      if @address_link_kind.update(address_link_kind_params)
        format.html { redirect_to @address_link_kind, notice: t('view.address_link_kinds.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_address_link_kind_url(@address_link_kind), alert: t('view.address_link_kinds.stale_object_error')
  end

  # DELETE /address_link_kinds/1
  def destroy
    @address_link_kind.destroy
    redirect_to address_link_kinds_url, notice: t('view.address_link_kinds.correctly_destroyed')
  end

  private

    def set_address_link_kind
      @address_link_kind = AddressLinkKind.find(params[:id])
    end

    def address_link_kind_params
      params.require(:address_link_kind).permit(:name)
    end
end
