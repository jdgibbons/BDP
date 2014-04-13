module CurrentMaterialCart
  extend ActiveSupport::Concern

  private

  def set_material_cart
    @material_cart = MaterialCart.find(session[:material_cart_id])
  rescue ActiveRecord::RecordNotFound
    @material_cart = MaterialCart.create
    session[:material_cart_id] = @material_cart.id
  end
end
