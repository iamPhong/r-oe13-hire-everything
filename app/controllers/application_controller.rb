class ApplicationController < ActionController::Base

  before_action :set_locale
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs_sign_up = [:firstname, :lastname, :email, :password, :password_confirmation, :remember_me]
    added_attrs_account_update = [:firstname, :lastname, :birthday, :avatar, :phone_number, :facebook, :website, :address, :email, :password,
      :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs_sign_up
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs_account_update
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
