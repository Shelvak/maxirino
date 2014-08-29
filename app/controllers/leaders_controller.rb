class LeadersController < ApplicationController
  before_action :set_leader, only:  [:show, :edit, :update, :destroy]

  # GET /leaders
  def index
    @title = t('view.leaders.index_title')
    @leaders = Leader.all.page(params[:page])
  end

  # GET /leaders/1
  def show
    @title = t('view.leaders.show_title')
  end

  # GET /leaders/new
  def new
    @title = t('view.leaders.new_title')
    @leader = Leader.new
  end

  # GET /leaders/1/edit
  def edit
    @title = t('view.leaders.edit_title')
  end

  # POST /leaders
  def create
    @title = t('view.leaders.new_title')
    @leader = Leader.new(leader_params)

    respond_to do |format|
      if @leader.save
        format.html { redirect_to @leader, notice: t('view.leaders.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PUT /leaders/1
  def update
    @title = t('view.leaders.edit_title')

    respond_to do |format|
      if @leader.update(leader_params)
        format.html { redirect_to @leader, notice: t('view.leaders.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_leader_url(@leader), alert: t('view.leaders.stale_object_error')
  end

  # DELETE /leaders/1
  def destroy
    @leader.destroy
    redirect_to leaders_url, notice: t('view.leaders.correctly_destroyed')
  end

  private

    def set_leader
      @leader = Leader.find(params[:id])
    end

    def leader_params
      params.require(:leader).permit(:name)
    end
end
