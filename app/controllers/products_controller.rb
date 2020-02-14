class ProductsController < ApplicationController
  
  require 'payjp'
  
  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
  end

  def create
  end

  def edit
    @products = Product.find(params[:id])
  end

  def update
  end

  def destroy
  end

  def show
    @product = Product.find(params[:id])
    @images = @product.images
  end

  def purchase
    
  end

  def pay
    @product = Product.find_by(params[:id])
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    Payjp::Charge.create(
    amount: @product.price,
    customer: card.customer_id,
    currency: 'jpy',
    )
    
    redirect_to controller: "top", action: 'index'
  end
  




end