class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_cart_item

  def current_cart_item
    if customer_customer
      @customer = Customer.find(session[:customer_id])
    else
      @customer = Customer.create
      session[:customer_id] = @custimer.id
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number ])
  end
end
