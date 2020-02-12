class ProductsController < ApplicationController
  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    binding.pry
    # @product = Product.find(params[:id])
    @product = Product.find(1)
    @product.destroy
  end

  def show
    @product = Product.find(params[:id])
    @images = @product.images
  end
end
