class TasksController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
  end

  def new
    @task = Task.new
  end

  def create
    Task.create(task_params)
    redirect_to root_path
  end
  
  private

  def task_params
    params.require(:task).permit(:task_name, :description, :category_id, :deadline).merge(user_id: current_user.id)
  end

end