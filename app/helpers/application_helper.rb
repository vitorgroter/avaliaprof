module ApplicationHelper
  # Returna o titulo da pagina
  def title
    base_title = "Polidex | "
    if @title.nil?
      base_title
    else
      base_title + @title
    end
  end


  def logo
    image_tag("logo.png", :alt => "Sample App", :class => "round")
  end
end
