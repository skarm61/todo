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

  def edit
     @list=List.find(params[:id])
     @title="Edit list"

    if(@list.user.id!=current_user.id)
      redirect_to root_path
    end



  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes(params[:list])
      flash[:success] = "Profile updated."
      redirect_to lists_path
    else
      @title = "Edit list"
      render 'edit'
    end
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