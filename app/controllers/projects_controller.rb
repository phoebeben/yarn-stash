class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
    @yarn = AssignedYarn.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to new_project_assigned_yarn_path(@project)
    else
      render 'projects/new', status: :unprocessable_entity
    end
  end

  def create_assigned_yarn(assigned_yarn)
    new_yarn = AssignedYarn.new(project_id: @project.id, yarn_id: assigned_yarn.id, quantity: params[:project][:end_date])
    new_yarn.save
  end

  def project_params
    params.require(:project).permit(:name, :start_date, :end_date)
  end

  def assigned_yarns_params
    params.require(:assigned_yarn).permit(:yarn_id, :project_id)
  end
end
