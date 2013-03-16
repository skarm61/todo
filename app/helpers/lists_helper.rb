 module ListsHelper

  def del
    image_tag("del.png", :alt => "Sample App", :class => "image_link")
  end

  def edit
    image_tag("edit.png", :alt => "Sample App", :class => "image_link")
  end

  def show_this_list?(list)
    if list.private==true
      if @auth!=true
              return false
      end
    end
    return true
  end
  
 end