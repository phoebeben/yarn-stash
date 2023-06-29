class YarnsController < ApplicationController
  def new
    @yarn = Yarn.new
  end

  def create
    @yarn = Yarn.new(yarn_params)
  end

  def yarn_params
    params.require(:yarn).permit(:name, :brand, :fibre_type, :yarn_weight, :skein_count, :weight, :yardage )
  end
end
