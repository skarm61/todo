class PagesController < ApplicationController

  def home
    @hide_sidebar=true
    @title = "Home"

    @news=New.paginate(:page => params[:page])
    @new_new=New.new

  end

  def contact
    @title = "Contact"    
  end

  def about
    @title = "About"
  end
  
  def help
    @title = "Help"
  end
  
end
