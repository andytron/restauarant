module ApplicationHelper
  
  def page_title
    [
      "Welcome to Willy Cafe",
      *@title
    ].compact.join(' - ')
    
  end

end