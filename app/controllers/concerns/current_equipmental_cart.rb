module CurrentEquipmentalCart
  extend ActiveSupport::Concern

  private

  def set_equipmental_cart
    @equipmental_cart = EquipmentalCart.find(session[:equipmental_cart_id])
  rescue ActiveRecord::RecordNotFound
    @equipmental_cart = EquipmentalCart.create
    session[:equipmental_cart_id] = @equipmental_cart.id
  end
end
