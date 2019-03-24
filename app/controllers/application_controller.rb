class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |_exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: "text/html" }
      format.html { redirect_to main_app.root_url, notice: "У вас нет прав на это действие" }
      format.js   { head :forbidden, content_type: "text/html" }
    end
  end
end
