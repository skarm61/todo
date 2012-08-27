class ListsController < ApplicationController
  before_filter :authenticate

  def index

  end

  def show
    @title=params[:user_id]
    
    @user=User.find(params[:user_id])
    @list=List.find(params[:list_id])
    if @list.nil?
      @title="sad"
    end
    @tasks = @list.tasks.paginate(:page => params[:page]) 
    @task=Task.new
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