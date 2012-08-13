class ListsController < ApplicationController
  before_filter :authenticate

  def show

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