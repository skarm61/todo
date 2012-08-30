class TasksController < ApplicationController
  before_filter :authenticate

  def create
    @title="sss"
  end

  def index
    @title="Tasks"
    
    @list = List.find(params[:list_id])   
        
    @user=User.find(@list.user_id)
    
    if @user==current_user
      @auth=true 
    end  
    
    @tasks = @list.tasks.paginate(:page => params[:page]) 
    @task = Task.new
    
  end

  def destroy
  end
end