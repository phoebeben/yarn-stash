class YarnsController < ApplicationController
  def show
    @yarn = Yarn.find(params[:id])
  end

  def new
    @yarn = Yarn.new
  end

  def create
    @yarn = Yarn.new(yarn_params)
    @yarn.user = current_user
    if @yarn.save
      redirect_to inventory_path
    else
      @yarn = Yarn.new
      render 'yarns/new', status: :unprocessable_entity
    end
  end

  def yarn_params
    params.require(:yarn).permit(:name, :brand, :fibre_type, :yarn_weight, :skein_count, :weight, :yardage)
  end
end
