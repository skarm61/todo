class TasksController < ApplicationController
  before_filter :authenticate

  def create
    @task  = @list.tasks.build(params[:task])
    if @task.save
      flash[:success] = "Task created!"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  def destroy
  end
end