module ApplicationHelper
  def better_time(object)
    object.strftime("%B %Y")
  end
end
