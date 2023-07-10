class ProjectsController < ApplicationController
  def new
    @project = Project.new
    @yarn = AssignedYarn.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    @yarns = Yarn.find(params[:project][:yarn_ids])
    if @project.save
      @assigned_yarns = AssignedYarn.new(project_id: @project.id, yarn_id: @yarns.id)
      @assigned_yarns.save
      raise
      redirect_to inventory_path(@project)
    else
      render 'projects/new', status: :unprocessable_entity
    end
  end

  def project_params
    params.require(:project).permit(:name, :start_date, :end_date)
  end

  def assigned_yarns_params
    params.require(:assigned_yarn).permit(:yarn_id, :project_id)
  end
end
