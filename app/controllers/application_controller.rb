class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :authenticate_usuario!
  layout :layout_by_resource

  private

  def layout_by_resource
    devise_controller? ? "devise" : "application"
  end
end
