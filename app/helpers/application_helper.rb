module ApplicationHelper
  def current_page_active(options)
    current_page?(options) ? 'active' : ''
  end
end
