module CurrentLaborCart
  extend ActiveSupport::Concern

  private

  def set_labor_cart
    @labor_cart = LaborCart.find(session[:labor_cart_id])
  rescue ActiveRecord::RecordNotFound
    @labor_cart = LaborCart.create
    session[:labor_cart_id] = @labor_cart.id
  end
end
