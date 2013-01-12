 module ListsHelper

  def del
    image_tag("del.png", :alt => "Sample App", :class => "round")
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