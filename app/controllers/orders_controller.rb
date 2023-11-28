class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
    redirect_to @order, notice: 'Order was successfully created.'
    else
    render :new
    end

  end

  def delete
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  



  def show
  @order = Order.find(params[:id])
  end

  def index
  
  @orders = Order.all
  end
  
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:user_id) # Ajoutez les attributs nécessaires
  end

 

end
