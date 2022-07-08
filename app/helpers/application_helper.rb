module ApplicationHelper
  def flash_class(level)
    case level
    when 'alert'
      'alert alert-danger'
    when 'success'
      'alert alert-success'
    end
  end
end
