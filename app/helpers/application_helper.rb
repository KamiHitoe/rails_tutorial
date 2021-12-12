module ApplicationHelper
  # you don't need to use include because it is automally loaded
  # help function
  
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty? # true or false
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
