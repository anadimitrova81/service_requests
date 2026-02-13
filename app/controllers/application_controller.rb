class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  helper_method :current_admin, :admin_logged_in?

  private

  def current_admin
    @current_admin ||= User.find_by(id: session[:admin_id]) if session[:admin_id]
  end

  def admin_logged_in?
    current_admin.present?
  end

  def require_admin
    unless admin_logged_in?
      redirect_to login_path, alert: "You must be logged in to access this page."
    end
  end
end
