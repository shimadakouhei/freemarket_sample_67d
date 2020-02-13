class ProductsController < ApplicationController
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
    @product = Product.find(params[:id]) 
    @product.destroy    
  end

  def show
    @product = Product.find(params[:id])
    @images = @product.images
  end
end