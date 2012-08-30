class ListsController < ApplicationController
  before_filter :authenticate

  def index
    
    if params[:user_id].nil?
    @user=current_user
    else
       @user = User.find(params[:user_id])
    end
    
    if @user==current_user
      @auth=true 
    end
    
    @title ="Lists"
    @lists = @user.lists.paginate(:page => params[:page]) 
    @list = List.new
  end

  def show
    @title=params[:user_id]
    
    @user=User.find(params[:user_id])
    @list=List.find(params[:id])
    
    if @list.nil?
      @title="sad"
    end
    @tasks = @list.tasks.paginate(:page => params[:page]) 
    @task=Task.new
    @task.content="sdd"
    @task.list_id=params[:list_id]
  end

  def create
        @list  = current_user.lists.build(params[:list])
    if @list.save
      flash[:success] = "List created!"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end
  
  def destroy
  end
  
end