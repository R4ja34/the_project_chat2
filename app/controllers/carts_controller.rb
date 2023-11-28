class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :create_cart_if_not_exists

  def show
    @cart = current_user.cart
    if @cart
      @cart_items = @cart.cart_items.includes(:item)
    else
      flash[:alert] = "Vous n'avez pas de panier. Veuillez ajouter des articles."
      redirect_to root_path
    end
  end

  def remove_item
    @item = Item.find(params[:item_id])
    @cart = current_user.cart
    if @cart
      @cart.cart_items.where(item: @item).destroy_all
      redirect_to cart_path, notice: 'Article retiré du panier!'
    else
      flash[:alert] = "Vous n'avez pas de panier. Veuillez créer un panier d'abord."
      redirect_to root_path
    end
  end

  private

  def create_cart_if_not_exists
    @cart = current_user.cart || Cart.create(user: current_user)
  end
end