class ProductsController < ApplicationController
    before_action :set_product, only: [:destroy]
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
    if
      @product.destroy
      flash[:notice] = "削除しました。"
      "/products/#{@product.id}"
    else
      flash[:notice] = "削除失敗しました。"
      "/products/#{@product.id}"
    end
  end

  def show
    @product = Product.find(params[:id])
    @images = @product.images
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end
end