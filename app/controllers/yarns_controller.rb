class YarnsController < ApplicationController
  def new
    @yarn = Yarn.new
  end
end
