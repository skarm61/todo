 module TasksHelper
  def done
    image_tag("done.png", :alt => "Sample App", :class => "round")
  end
  
  def not_done
    image_tag("not_done.png", :alt => "Sample App", :class => "round")
  end
  
  def del
    image_tag("del.png", :alt => "Sample App", :class => "round")
  end
  
  
  
 end