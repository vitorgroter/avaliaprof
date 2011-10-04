module ApplicationHelper
  # Returna o titulo da pagina
  def title
    base_title = "AvaliaProf | "
    if @title.nil?
      base_title
    else
      base_title + @title
    end
  end
end
