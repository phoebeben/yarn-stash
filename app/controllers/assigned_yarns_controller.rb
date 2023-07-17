class AssignedYarnsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @assigned_yarn = AssignedYarn.new
  end

  def create
    @project = Project.find(params[:project_id])
    @assigned_yarn = AssignedYarn.new
    if params[:commit] == "Add more yarn"
      redirect_to new_project_assigned_yarn_path, locals: { project: @project, assigned_yarn: @assigned_yarn }
    else
      raise
    end
  end
end
