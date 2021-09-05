class ApplicationController < ActionController::Base
  # actionを記載
  
  def hello
    render html: "hello, rails!"
  end
end
