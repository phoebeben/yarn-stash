class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def inventory
    @yarns = Yarn.all
  end
end
