module ApplicationHelper
  # 自動的に全ファイルで読み込まれるから、includeはいらない
  
  
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty? # true or false
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
