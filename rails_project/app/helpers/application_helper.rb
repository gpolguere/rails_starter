module ApplicationHelper

  def controller_name
    params[:controller].split("/").last
  end

end
