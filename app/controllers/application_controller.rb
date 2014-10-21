# coding: utf-8
class ApplicationController < ActionController::Base

  layout :layout_by_resource
  
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  # コントローラによってレイアウトを振り分ける
  # @return [String] レイアウト名
  # @return [boolean] レイアウトがない場合 => false
  def layout_by_resource
    if devise_controller?
      false
    else
      "application"
    end
  end
    
end
