module ApplicationHelper

  #Return the full title on per-page basis
  def full_title(page_title = '')
    base_title = "Cr9Co0"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
