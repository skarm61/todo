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
  end

  def create
        @list  = current_user.lists.build(params[:list])
    if @list.save
      flash[:success] = "List created!"
      redirect_to url_for(:controller=>"lists",:action=>"index")
    else
      render 'pages/home'
    end
  end
  
  def destroy
    @list=List.find(params[:id])
    @list.destroy
    redirect_to lists_path 
  end
    
end