class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]


  def index  
    @projects = Project.all
  end

  def new 
    @project = Project.new
  end

  def show 
  end

  def edit
  end

  def create 
    #whitelisting params
    # project_params = params.require(:project).permit(:title, :description, :due_date)
    @project = Project.new project_params_whitelisting
    if @project.save 
      flash[:notice] = "Project created successfully"
      redirect_to project_path(@project)
    else
      render :new
    end

  end

  def update 
    #whitelisting params
    # project_params = params.require(:project).permit(:title, :description, :due_date)
    # @project = Project.find params[:id]
    if @project.update project_params_whitelisting
      flash[:notice] = "Project has been successfully updated"
      redirect_to projects_path
    else
      render :edit
    end
  end

  def destroy 
    # @project = Project.find params[:id]
    @project.destroy
    flash[:notice] = "Project has been successfully deleted"
    redirect_to projects_path
  end



  private

  def set_project 
    @project = Project.find params[:id]
  end

  
  def project_params_whitelisting
    project_params = params.require(:project).permit(:title, :description, :due_date)
  end

end
