class AssignedYarnsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @assigned_yarn = AssignedYarn.new
  end

  def create
    @project = Project.find(params[:project_id])
    @assigned_yarn = AssignedYarn.new(assigned_yarn_params)
    @assigned_yarn.project_id = @project.id
    if @assigned_yarn.save
      add_more_check
    else
      render 'assigned_yarns/new', status: :unprocessable_entity
    end
  end

  def assigned_yarn_params
    params.require(:assigned_yarn).permit(:yarn_id, :quantity)
  end

  def add_more_check
    if params[:commit] == "Add more yarn"
      redirect_to new_project_assigned_yarn_path, locals: { project: @project, assigned_yarn: @assigned_yarn }
    else
      redirect_to projects_path
    end
  end

  def check_quantity
    AssignedYarn.where(project_id: project.id).each do |yarn|
      Yarn.find(yarn.id)
    end
  end
end
