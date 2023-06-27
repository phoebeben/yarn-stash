class YarnController < ApplicationController
  def new
    @yarn = Yarn.new
  end
end
