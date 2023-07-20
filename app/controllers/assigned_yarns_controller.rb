class AssignedYarnsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @assigned_yarn = AssignedYarn.new
  end

  def create
    @project = Project.find(params[:project_id])
    @assigned_yarn = AssignedYarn.new(assigned_yarn_params)
    @assigned_yarn.project_id = @project.id
    yarn = Yarn.find(params[:assigned_yarn][:yarn_id])
    submitted_quantity = params[:assigned_yarn][:quantity]
    if check_quantity(submitted_quantity, @project, yarn) == true
      if @assigned_yarn.save
        add_more_check
      else
        render 'assigned_yarns/new', status: :unprocessable_entity
      end
    else
      redirect_to new_project_assigned_yarn_path(@project), notice: "Not enough yarn quantity to assign."
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

  def check_quantity(submitted_quantity, project, yarn)
    assigned_yarns = AssignedYarn.where(project_id: project.id, yarn_id: yarn.id)
    quantity = 0
    assigned_yarns.each do |assigned_yarn|
      quantity += assigned_yarn.quantity
    end
    available_quantity = yarn.skein_count - quantity
    submitted_quantity.to_i < available_quantity
  end
end
