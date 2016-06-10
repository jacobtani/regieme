class CgsController < ApplicationController
  before_action :set_cg, only: [:edit, :update, :show, :destroy]
  
  def index
    @cgs = Cg.all
  end

  def new
    @cg  = Cg.new
  end

  def create
    @cg = Cg.new cg_params
    respond_to do |format|
      if @cg.save
        flash[:success] = "Cg was created successfully."
        format.html { redirect_to root_path }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @cg.update_attributes cg_params
        flash[:success] = "Cg was updated successfully."
        format.html { redirect_to root_path }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @cg.destroy
    redirect_to root_path
  end

  private

    def cg_params
      params.require(:cg).permit(:guest_names, :item_name)
    end

    def set_cg
      @cg = Cg.find params[:id] rescue nil
      return not_found! unless @cg
    end


end