 module TasksHelper
  def done
    image_tag("done.png", :alt => "Sample App", :class => "image_link")
  end
  
  def not_done
    image_tag("not_done.png", :alt => "Sample App", :class => "image_link")
  end
  
  def del
    image_tag("del.png", :alt => "Sample App", :class => "image_link")
  end
  
  
  
 end