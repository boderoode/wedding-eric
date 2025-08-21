class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Tell Devise to use the application layout for admin pages
  layout :layout_by_resource

  private

  def layout_by_resource
    if devise_controller? && resource_name == :user
      "application"
    else
      "application"
    end
  end
end
