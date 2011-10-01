module ApplicationHelper
  def is_admin?
    current_user && current_user.admin
  end

  def markdown(text)
    Redcarpet.new(text).to_html.html_safe
  end
end
