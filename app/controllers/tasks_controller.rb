class TasksController < ApplicationController
  before_filter :authenticate

  def create
    
    @list= List.find(params[:list_id]) 
      
    @task=@list.tasks.create(params[:task])
    @task.save!
    redirect_to url_for(:controller=>"tasks",:action=>"index",:list_id=>params[:list_id])
  end

  def index
    @title="Tasks"
    
    @list = List.find(params[:list_id])   
        
    @user=User.find(@list.user_id)
    
    if @user==current_user
      @auth=true 
    end  
    
    @tasks = @list.tasks.paginate(:page => params[:page]) 
    @task = @list.tasks.build
    
  end

  def destroy
    @task=Task.find(params[:id])
    @task.destroy
    redirect_to url_for(:controller=>"tasks",:action=>"index",:list_id=>params[:list_id])
  end
end