class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def inventory
    @yarns = Yarn.where(user_id: current_user.id)
  end
end
