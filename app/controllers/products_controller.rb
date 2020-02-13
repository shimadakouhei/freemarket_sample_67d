class ProductsController < ApplicationController
  def index
    @products = Product.includes(:images).order('created_at DESC')
  end

  def new
  end

  def create

  end

 
  def show
  end
  
  def edit
    @product = Product.find(params[:id])
    @images = @product.images
  end

  def update
    product = Product.find(params[:id])
    if product.update(product_params)
      flash[:notice] = "編集しました。"
      redirect_to
    else
      flash[:notice] = "必須項目が空欄です。"
      render :edit
    end
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:name, :conditions, :delivery_charge, :prefecture, :delivery_day, :text, :user_id, :category_id, :brand_id, :price, images_attributes:  [:src, :_destroy, :product_id]).merge(user_id: current_user.id)
  end
end

 