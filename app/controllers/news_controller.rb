class NewsController < ApplicationController

  def index
    @news=New.paginate(:page => params[:page])
    @new=New.new
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