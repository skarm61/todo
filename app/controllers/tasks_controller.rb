class TasksController < ApplicationController
  before_filter :authenticate

  def create
    
    @list= List.find(params[:list_id])       
    @task=@list.tasks.create(params[:task])    
    
    respond_to do |format|  
      if @task.save        
        format.js   
        format.html {redirect_to list_tasks_path(params[:list_id])}
      else        
        format.js   
        format.html {redirect_to list_tasks_path(params[:list_id])}
      end
    end 
  end

  def index
    @title="Tasks"
    
    @list = List.find(params[:list_id])   
        
    @user=User.find(@list.user_id)
    
    if @user==current_user
      @auth=true 
    end

    if(@list.private)
      if @auth!=true
        redirect_back_or url_for(:controller=>"lists",:action=>"index",:user_id=>@user.id)
      end
    end
    
    @tasks = @list.tasks.paginate(:page => params[:page]) 
    @task = @list.tasks.build
    
  end
  
  def done
    @task=Task.find(params[:task_id])
    @task.is_done=1
    @task.save   
    
    respond_to do |format|  
      format.js
      format.html {redirect_to list_tasks_path(params[:list_id])}
    end
    
  end

  def not_done
    @task=Task.find(params[:task_id])
    @task.is_done=0
    @task.save
    
    
    respond_to do |format|
      format.js
      format.html {redirect_to list_tasks_path(params[:list_id])}
    end
    
  end
  
  def destroy
    @task=Task.find(params[:id])
    @task.destroy
    redirect_to url_for(:controller=>"tasks",:action=>"index",:list_id=>params[:list_id])
  end
end